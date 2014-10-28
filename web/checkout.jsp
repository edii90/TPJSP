<%-- 
    Document   : checkout
    Created on : 17/10/2014, 18:57:42
    Author     : Leandro
--%>

<%@page import="Modelo.LineaDeCompra"%>
<%@page import="java.util.Enumeration"%>
<%@page import="Modelo.Compras"%>
<%@page import="java.util.Hashtable"%>
<%@page import="Modelo.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if (session.getAttribute("user") == null) {
        request.getSession().setAttribute("ErrorLogin", "Usuario no logueado");
        response.sendRedirect("index.jsp");
    } else {
        Usuarios Euser = (Usuarios) session.getAttribute("user");

        Hashtable detalles = new Hashtable();
        Compras ocompra = new Compras(Euser);
        
        if (session.getAttribute("detalles") != null) {
            detalles = (Hashtable) session.getAttribute("detalles");
        }
        ocompra.setLista(detalles);


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
        <title>Checkout - Ferreteria UTN</title>
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
                        <li class="hidden-xs active">
                            <a id="cart" href="checkout.jsp"><i class="glyphicon glyphicon-shopping-cart"></i>(<%=detalles.size()%>)</a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>  <jsp:getProperty name="sessionuser" property="usuario" /> <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <% if (((Usuarios) session.getAttribute("user")).getTipoUsr() == 1) { %>
                                <li><a href="administration.jsp"><span class="glyphicon glyphicon-cog"></span> Administrar Usuarios</a></li>
                                    <% }%>
                                <li><a href="Logout"><span class="glyphicon glyphicon-off"></span> Cerrar Sesion</a></li>
                            </ul>
                        </li>
                    </ul>
                </div><!-- /.nav-collapse -->
            </div><!-- /.container -->
        </div><!-- /.navbar -->
        <div class="container">
            <br>
            <div class="row">
                <div class="col-sm-10 col-md-8 detalles panel panel-default">
                    <div class="panel-heading"> Mi Carrito</div>
                    <div class="panel-body">          
                        <% if (detalles.size() > 0) {
                                Enumeration enums = detalles.elements();
                                LineaDeCompra linea = new LineaDeCompra();
                                while (enums.hasMoreElements()) {
                                    linea = (LineaDeCompra) enums.nextElement();

                        %>

                        <div class="row item">
                            <div class="col-sm-2 cell img"><img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="200x200" src="<%=linea.getImg()%>"></div>
                            <div class="col-xs-6 col-sm-6 cell text">
                                <h4><%=linea.getNombre()%></h4>
                                <div class="descripcion">Stock: <%=linea.getStock()%></div>
                                <span> $<%=linea.getCostoUnit()%></span><div class="clearfix"></div>
                            </div>
                            <div class="col-xs-3 col-sm-2 cell input">
                                <strong>Cantidad:</strong><div class="clearfix"></div>
                                <input name="sku<%=linea.getId()%>" type="text" class="form-control input-sm input-cant" placeholder="9999" value="<%=linea.getCantidad()%>"><div class="clearfix"></div>
                            </div>
                            <div class="col-xs-3 col-sm-2 cell button">
                                <button id="modificar" type="button" data-prod="<%=linea.getId()%>" class="btn btn-modificar"><span class="glyphicon glyphicon-floppy-disk"></span></button>
                                <button id="eliminar" type="button" data-prod="<%=linea.getId()%>" class="btn btn-eliminar"><span class="glyphicon glyphicon-trash"></span></button>
                            </div>
                        </div><!-- /.item -->
                        <%}
                        } else {%>
                        <div class='empty'><img class='img-responsive' src='img/empty-cart.png'/></div>
                            <%}%>


                    </div><!-- /.panelbody -->
                </div><!-- /.detalles -->
                <div class="col-sm-2 col-md-4 lateral">
                    <div class="row cuadro">
                        <h1>TOTAL:</h1>
                        <div class="well"><h3><%=ocompra.calcularTotal()%></h3></div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="row cuadro">
                        <div class="col-xs-6"><button id="seguir" type="button" class="btn btn-seguir"><a href="main.jsp">Seguir Comprando</a></button></div>
                        <% if (detalles.size() > 0) {
                        %>                     
                        <div class="col-xs-6"><button id="confirmar" type="button" class="btn btn-confirmar">Confirmar</button></div>
                        <%} else {%>
                        <div class="col-xs-6"><button id="confirmar" type="button" class="btn btn-confirmar disabled">Confirmar</button></div>
                        <%}%>
                    </div>
                </div><!-- /.lateral -->

            </div><!-- /.row --> 
        </div><!-- /.container -->
        <div class="footer navbar-inverse">
            <div class="container">
                <p class="text-muted"><strong>Tp Servlet - Santillan Leandro</strong></p>
            </div>
        </div>
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/carrito.js"></script>
    </body>
</html>
<% }%>