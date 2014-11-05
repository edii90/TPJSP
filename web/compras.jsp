<%-- 
    Document   : compras
    Created on : 30/10/2014, 17:23:49
    Author     : Leandro
--%>
<%@page import="Modelo.LineaDeCompra"%>
<%@page import="Modelo.Compras"%>
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

        RequestDispatcher rds = request.getRequestDispatcher("AdaptadoraObtenerCompras");
        rds.include(request, response);


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
        <title>Compras - Ferreteria UTN</title>
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
            <h1 class="page-header">Administrar Compras</h1>
            <% if (session.getAttribute("ABMCompras") != null) {%>
            <div class="alert alert-info" role="alert" >
                <% String msj = (String) session.getAttribute("ABMCompras");
                    out.println(msj);
                    session.setAttribute("ABMCompras", null); %>
            </div>
            <% }%>
            <div class="panel-group" id="accordion">
                <%if (request.getSession().getAttribute("Compras") != null) {
                        Hashtable compras = (Hashtable) request.getSession().getAttribute("Compras");
                        Enumeration com = compras.elements();
                        String in = "in";
                        boolean empty = false;

                        while (com.hasMoreElements()) {
                            Compras aux = (Compras) com.nextElement();
                            aux.calcularTotal();
                            Enumeration lineas = aux.getLista().elements();
                            if (aux.getEstado() == "Pendiente") {
                %>             
                <div id="lineadecompra" class="panel panel-warning user<%=aux.getUsr().getId()%>">

                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse<%=aux.getId()%>">
                                Orden #<%=aux.getId()%>  (Total: <%=aux.getTotal()%>) - <%=aux.getFecha()%> - Estado <%=aux.getEstado()%>
                            </a>
                            Estado: <select class="form-control" id="estado" style="max-width: 250px; display: inline">                                
                                <option value="2"<% if (aux.getEstado() == "Rechazada") {
                                        out.println("selected");
                                    } %>>Rechazada</option>
                                <option value="3"<% if (aux.getEstado() == "Aprobada") {
                                        out.println("selected");
                                    }%>>Aprobada</option>
                            </select>
                            <button id="modificar" type="button" data-compra="<%=aux.getId()%>" class="btn btn-modificar"><span class="glyphicon glyphicon-floppy-disk"></span></button>
                        </h4>
                    </div>
                    <div id="collapse<%=aux.getId()%>" class="panel-collapse collapse <%= in%>">
                        <div class="panel-body">
                            <% while (lineas.hasMoreElements()) {
                                    LineaDeCompra lin = (LineaDeCompra) lineas.nextElement();
                            %>

                            <div class="row item">
                                <div class="col-sm-2 cell img"><img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="200x200" src="<%=lin.getImg()%>"></div>
                                <div class="col-xs-6 col-sm-6 cell text">
                                    <h4><%=lin.getNombre()%></h4>     
                                    <br>
                                    <span> $<%=lin.getCostoUnit()%></span><div class="clearfix"></div>
                                </div>
                                <div class="col-xs-3 col-sm-2 cell input">
                                    <strong>Cantidad:</strong><div class="clearfix"></div>
                                    <input name="sku<%=lin.getId()%>" type="text" readonly="" class="form-control input-sm input-cant" value="<%=lin.getCantidad()%>"><div class="clearfix"></div>
                                </div>
                                <div class="col-xs-3 col-sm-2 cell button">
                                    <strong>Subtotal:</strong><div class="clearfix"></div>
                                    $<%=lin.getCostoUnit() * lin.getCantidad()%>
                                </div>

                            </div><!-- /.item -->
                            <% }
                                        in = "";%>

                        </div><!-- /.panelbody -->
                    </div><!-- /.collapse -->
                </div><!-- /.panel -->

                <%
                            } else{
                                empty = true;
                            }
                        }
                        if(empty)
                        {%>
                        <div class="well well-lg"><strong>No Hay Compras Pendientes</strong></div>
                        <%}
                    }
                %>
            </div><!-- /.panel-group -->

        </div><!-- /.container -->
        <div class="footer navbar-inverse">
            <div class="container">
                <p class="text-muted"><strong>Tp Servlet - Santillan Leandro</strong></p>
            </div>
        </div>
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/compras.js"></script> 
    </body>
</html>
<% }%>
