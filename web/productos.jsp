<%-- 
    Document   : productos
    Created on : 30/10/2014, 17:19:16
    Author     : Leandro
--%>

<%@page import="Modelo.Productos"%>
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
        RequestDispatcher rd = request.getRequestDispatcher("AdaptadoraObtenerProductos");
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
        <title>Productos - Ferreteria UTN</title>
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
            <h1 class="page-header">Administrar Productos</h1>
            <% if (session.getAttribute("ABMProductos") != null) {%>
            <div class="alert alert-info" role="alert" >
                <% String msj = (String) session.getAttribute("ABMProductos");
                    out.println(msj);%>
            </div>
            <% }%>


            <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title" id="myModalLabel">Modificar Producto</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-horizontal" id="formulario" role="form">
                                <div class="form-group">
                                    <label  for="nombre">Nombre</label>
                                    <input type="text" class="form-control" name="mod-nombre" id="mod-nombre" placeholder="Nombre" autofocus="" required="">
                                </div>
                                <div class="form-group">
                                    <label  for="Precio">Precio</label>
                                    <input type="text" class="form-control" name="mod-precio" id="mod-precio" placeholder="Precio" required="">
                                </div>
                                <div class="form-group">
                                    <label  for="Stock">Stock</label>
                                    <input type="text" class="form-control" name="mod-stock" id="mod-stock" placeholder="Stock"  required="">

                                </div>
                                <div class="form-group">
                                    <label for="Imagen">Imagen</label>
                                    <input type="text" class="form-control" name="mod-imagen" id="mod-imagen" placeholder="Imagen" required="" maxlength="10">
                                </div>                               

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button id="confirmar" type="button" data-id="0" class="btn btn-primary">Guardar</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">

                <div class="col-md-3 pull-left">
                    <div class="panel panel-default">
                        <div class="panel-heading">Registro de Productos</div>
                        <div class="panel-body">
                            <form class="form-horizontal" id="formulario" role="form">
                                <div class="form-group">
                                    <label class="sr-only" for="nombre">Nombre</label>
                                    <input type="text" class="form-control" name="reg-nombre" id="reg-nombre" placeholder="Nombre" autofocus="" required="">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="Precio">Precio</label>
                                    <input type="text" class="form-control" name="reg-precio" id="reg-precio" placeholder="Precio"  required="">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="Stock">Stock</label>
                                    <input type="text" class="form-control" name="reg-stock" id="reg-stock" placeholder="Stock"  required="">

                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="Imagen">Imagen</label>
                                    <input type="text" class="form-control disabled" value="img/noimage.jpg" name="reg-imagen" id="reg-usuario" placeholder="Imagen" required="" >
                                </div> 
                                <hr>
                                <button id="reg" class="btn btn-primary pull-left">Registrar</button> 
                                <button type="reset" class="btn btn-warning pull-right">Resetear</button>
                            </form>
                        </div><!-- panel-body -->
                    </div><!-- panel -->
                </div><!-- /col-md-3 pull-left -->
                <div class="col-md-9 pull-right">
                    <div class="panel panel-default">
                        <!-- Default panel contents -->
                        <div class="panel-heading">Lista de Productos</div>
                        <div class="panel-body">
                            <p>Lista de todos los productos registrados</p>
                            <% if (session.getAttribute("Productos") != null) {
                                    Hashtable productos = (Hashtable) session.getAttribute("Productos");
                                    Enumeration lista = productos.elements();
                                     while (lista.hasMoreElements()) {
                                         Productos prod = (Productos) lista.nextElement();%>

                            <div class="row item item<%=prod.getId()%>">
                                <div class="col-sm-2 cell img"><img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="200x200" src="<%= prod.getImg()%>"></div>
                                <div class="col-xs-9 col-sm-8 cell text" style="display: inline-block">
                                    <h4><%= prod.getNombre()%></h4>
                                    <div class="descripcion">Stock: <%= prod.getStock()%> </div>
                                    <span> $<%= prod.getPrecio()%></span>
                                </div>
                                
                                <div class="col-xs-3 col-sm-2 cell button">
                                <button id="modificar" type="button" data-prod="<%=prod.getId()%>" data-nombre="<%= prod.getNombre() %>" data-precio="<%=prod.getPrecio() %>" data-stock="<%=prod.getStock() %>" data-imagen="<%=prod.getImg() %>" class="btn btn-modificar" data-toggle="modal" data-target=".bs-example-modal-sm"><span class="glyphicon glyphicon-edit"></span></button>
                                <button id="eliminar" type="button" data-prod="<%=prod.getId()%>" class="btn btn-eliminar"><span class="glyphicon glyphicon-trash"></span></button>
                            </div>

                            </div><!-- /.item -->
                            <% }
                                }%>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- /.container -->
        <div class="footer navbar-inverse">
            <div class="container">
                <p class="text-muted"><strong>Tp Servlet - Santillan Leandro</strong></p>
            </div>
        </div>
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/productos.js"></script>
        <script> $(".alert").alert()</script>



    </body>
</html>
<% }%>
