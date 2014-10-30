<%-- 
    Document   : main
    Created on : 17/10/2014, 18:56:24
    Author     : Leandro
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Usuarios"%>
<%@page import="Modelo.Productos"%>
<jsp:useBean id="sessionuser" class="Modelo.Usuarios" scope="session"  />
<%
    if (session.getAttribute("user") == null) {
        request.getSession().setAttribute("ErrorLogin", "Usuario no logueado");
        response.sendRedirect("index.jsp");
    } else {
        Usuarios Euser = (Usuarios) session.getAttribute("user");

%>

<jsp:setProperty name="sessionuser" property="id" value= "<%=Euser.getId()%>"/>
<jsp:setProperty name="sessionuser" property="usuario" value="<%=Euser.getUsuario()%>"/>
<jsp:setProperty name="sessionuser" property="contrasenia" value="<%=Euser.getContrasenia()%>"/>
<jsp:setProperty name="sessionuser" property="DNI" value="<%=Euser.getDNI()%>"/>
<jsp:setProperty name="sessionuser" property="nombre" value="<%=Euser.getNombre()%>"/>
<jsp:setProperty name="sessionuser" property="apellido" value="<%=Euser.getApellido()%>"/>
<jsp:setProperty name="sessionuser" property="tipoUsr" value="<%=Euser.getTipoUsr()%>"/>
<jsp:setProperty name="sessionuser" property="estado" value="<%=Euser.isEstado()%>"/>
<% 
    if (session.getAttribute("Productos") == null) {
        RequestDispatcher rd = request.getRequestDispatcher("AdaptadoraObtenerProductos");
        rd.include(request, response);
    }
    Hashtable detalles = new Hashtable();
    if (session.getAttribute("detalles") != null) {
        detalles = (Hashtable) session.getAttribute("detalles");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Bievenido - Ferreteria UTN</title>
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
                        <li class="active"><a href="main.jsp"><span class="glyphicon glyphicon-home"></span> Inicio</a></li>
                        <li><a href="history.jsp">Historial</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="buscador">
                            <div class="input-group">
                                <input type="text" class="form-control" id="busqueda" name="busqueda" placeholder="Producto">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" id="buscar" type="button"><span id="iconbuscar" data-opt="false" class="glyphicon glyphicon-search"></span></button>
                                </span>
                            </div><!-- /input-group -->                    
                        </li>
                        <li class="hidden-xs">
                            <a id="cart" href="checkout.jsp"><i class="glyphicon glyphicon-shopping-cart"></i>(<%=detalles.size()%>)</a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> <jsp:getProperty name="sessionuser" property="usuario" /> <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <% if (((Usuarios) session.getAttribute("user")).getTipoUsr() == 1) { %>
                                <li><a href="administration.jsp"><span class="glyphicon glyphicon-cog"></span> Administrar Usuarios</a></li>
                                <li><a href="productos.jsp"> Productos</a></li> 
                                <li><a href="compras.jsp"> Compras</a></li>
                                <li><a href="piqueo.jsp"> Piqueos</a></li>
                                <% }%>
                                <li><a href="Logout"><span class="glyphicon glyphicon-off"></span> Cerrar Sesion</a></li>
                            </ul>
                        </li>


                    </ul>
                </div><!-- /.nav-collapse -->
            </div><!-- /.container -->
        </div><!-- /.navbar -->

        <div class="container">
            <div class="row">                
                <div class="col-xs-8 col-sm-9 col-md-10 main">
                    <h1 class="page-header">Productos</h1>

                    <div class="row placeholders" id="contenedor">
                        <% if (session.getAttribute("Productos") != null) {
                                Hashtable productos = (Hashtable) session.getAttribute("Productos");
                                Enumeration lista = productos.elements();
                                while (lista.hasMoreElements()) {
                                    Productos prod = (Productos) lista.nextElement();%>
                        <div class="col-xs-12 col-sm-6 placeholder mix" data-myorder="<%=prod.getId()%>" style="display: inline-block;">
                            <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="200x200" src="<%= prod.getImg()%>">
                            <h4><%= prod.getNombre()%></h4><div class="clearfix"></div>
                            <div class="descripcion">Stock: <%= prod.getStock()%></div><div class="clearfix"></div>
                            <span> $<%= prod.getPrecio()%></span><div class="clearfix"></div>
                            <input name="sku<%= prod.getId()%>" type="text" class="form-control input-sm input-cant" data-stock="<%= prod.getStock()%>" placeholder="Cantidad"><div class="clearfix"></div>
                            <button id="comprar" type="button" data-prod="<%= prod.getId()%>" class="btn-sm btn-comprar"><strong>Comprar</strong></button>
                        </div>

                        <% }
                            }%>

                    </div><!--row placeholders-->
                </div><!--main-->
            </div><!--row-->
        </div><!-- /.container -->
        <div class="footer navbar-inverse">
            <div class="container">
                <p class="text-muted"><strong>Tp Servlet - Santillan Leandro</strong></p>
            </div><!-- /.container footer-->
        </div>
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!--<script src="js/jquery.mixitup.min.js"></script>-->
        <script src="js/inicio.js"></script>
    </body>
</html>
<% }%>