<%-- 
    Document   : piqueo
    Created on : 30/10/2014, 17:24:10
    Author     : Leandro
--%>

<%@page import="Modelo.LineaDePiqueo"%>
<%@page import="Modelo.Piqueos"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="Modelo.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if (session.getAttribute("user") == null) {
        request.getSession().setAttribute("ErrorLogin", "Usuario no logueado");
        response.sendRedirect("index.jsp");
    } else {
        Usuarios Euser = (Usuarios) session.getAttribute("user");
        if (Euser.getTipoUsr() != 1) {
            response.sendRedirect("main.jsp");
        }

        Hashtable detalles = new Hashtable();
        if (session.getAttribute("detalles") != null) {
            detalles = (Hashtable) session.getAttribute("detalles");
        }
        RequestDispatcher rd = request.getRequestDispatcher("ControladoraPiqueo");
        rd.include(request, response);


%>
<jsp:useBean id="sessionuser" class="Modelo.Usuarios" scope="session"  />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Piqueos - Ferreteria UTN</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-theme.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="main.jsp">Ferreteria</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="main.jsp"><span class="glyphicon glyphicon-home"></span> Inicio</a></li>
                        <li><a href="history.jsp">Historial</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="hidden-xs">
                            <a id="cart" href="checkout.jsp"><i class="glyphicon glyphicon-shopping-cart"></i>(<%=detalles.size()%>)</a>
                        </li>
                        <li class="dropdown active">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>  <jsp:getProperty name="sessionuser" property="usuario" /> <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">

                                <li><a href="administration.jsp"><span class="glyphicon glyphicon-cog"></span> Administrar Usuarios</a></li>
                                <li><a href="productos.jsp"> Productos</a></li>
                                <li><a href="compras.jsp"> Compras</a></li>
                                <li><a href="piqueo.jsp"> Piqueos</a></li>

                                <li><a href="Logout"><span class="glyphicon glyphicon-off"></span> Cerrar Sesion</a></li>
                            </ul>
                        </li>
                    </ul>
                </div><!-- /.nav-collapse -->
            </div><!-- /.container -->
        </div><!-- /.navbar -->

        <div class="container"> 
            <h1 class="page-header">Administrar Piqueos</h1>        

            <% if (session.getAttribute("MsjPiqueos") != null) {%>
            <div class="alert alert-info" role="alert" >
                <% String msj = (String) session.getAttribute("MsjPiqueos");
                    out.println(msj);
                    session.setAttribute("MsjPiqueos", null); %>
            </div>
            <% } %>

            <% if (request.getAttribute("piqueos") != null) {
                    Hashtable piqueos = (Hashtable) request.getAttribute("piqueos");
                    Enumeration com = piqueos.elements();
                    boolean empty = true;

                    while (com.hasMoreElements()) {
                        Piqueos aux = (Piqueos) com.nextElement();%>
            <div style="text-align: center; margin-bottom: 15px"><input type="button" data-id="<%=aux.getId()%>" value="Confirmar Piqueo #<%=aux.getId()%>" name="Confirmar" id="confirmar" class="btn btn-confirmar btn-lg" /> </div>
                <%

                    Enumeration lineas = aux.getProductos().elements();

                    if (aux.getEstado() == "No procesado") {
                        while (lineas.hasMoreElements()) {
                            LineaDePiqueo lin = (LineaDePiqueo) lineas.nextElement();

                %>             

            <div class="row item" style="display: inline-block; text-align: center">
                <h4><%=lin.getNombre()%></h4>  
                Cantidad:<input type="text" readonly="" class="form-control input-sm input-cant" value="<%=lin.getCantidad()%>"><div class="clearfix"></div>
            </div><!-- /.item -->
            <% }

                        empty = false;
                    } else {
                       // empty = true;
                    }
                }
                if (empty) { %>
                    <div style="text-align: center; margin-bottom: 15px"><input type="button" value="Confirmar Piqueo" name="Confirmar" id="confirmar" class="btn btn-confirmar btn-lg" /></div>
                    <div class="well well-lg"><strong>No Hay Piqueos Pendientes</strong></div>
                <% }
                }
            %>



        </div><!-- /.container -->
        <div class="footer navbar-inverse">
            <div class="container">
                <p class="text-muted"><strong>Tp Servlet - Santillan Leandro</strong></p>
            </div>
        </div>
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/piqueos.js"></script>
    </body>
</html>
<% }%>
