<%-- 
    Document   : productos
    Created on : 30/10/2014, 17:19:16
    Author     : Leandro
--%>

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
                            <h4 class="modal-title" id="myModalLabel">Modificar Usuario</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-horizontal" id="formulario" role="form">
                                <div class="form-group">
                                    <label  for="nombre">Nombre</label>
                                    <input type="text" class="form-control" name="mod-nombre" id="mod-nombre" placeholder="Nombre" autofocus="" required="">
                                </div>
                                <div class="form-group">
                                    <label  for="apellido">Apellido</label>
                                    <input type="text" class="form-control" name="mod-apellido" id="mod-apellido" placeholder="Apellido" required="">
                                </div>
                                <div class="form-group">
                                    <label  for="DNI">DNI</label>
                                    <input type="text" class="form-control" name="mod-dni" id="mod-dni" placeholder="DNI"  required="">

                                </div>
                                <div class="form-group">
                                    <label for="usuario">Usuario</label>
                                    <input type="text" class="form-control" name="mod-usuario" id="mod-usuario" placeholder="Usuario" required="" maxlength="10">
                                </div>                                
                                <div class="form-group">
                                    <label  for="pass">Password</label>
                                    <input type="text" class="form-control" name="mod-pass" id="mod-pass" placeholder="Password" required="" maxlength="20">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="mod-adm" id="mod-adm"> Administrador
                                    </label>
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
                        <div class="panel-heading">Registro de Usuarios</div>
                        <div class="panel-body">
                            <form class="form-horizontal" id="formulario" role="form">
                                <div class="form-group">
                                    <label class="sr-only" for="nombre">Nombre</label>
                                    <input type="text" class="form-control" name="reg-nombre" id="reg-nombre" placeholder="Nombre" autofocus="" required="">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="apellido">Apellido</label>
                                    <input type="text" class="form-control" name="reg-apellido" id="reg-apellido" placeholder="Apellido"  required="">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="DNI">DNI</label>
                                    <input type="text" class="form-control" name="reg-dni" id="reg-dni" placeholder="DNI"  required="">

                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="usuario">Usuario</label>
                                    <input type="text" class="form-control" name="reg-usuario" id="reg-usuario" placeholder="Usuario" required="" maxlength="10">
                                </div>                                
                                <div class="form-group">
                                    <label class="sr-only" for="pass">Password</label>
                                    <input type="text" class="form-control" name="reg-pass" id="reg-pass" placeholder="Password" required="" maxlength="20">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="reg-adm" id="reg-adm"> Administrador
                                    </label>
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
                        <div class="panel-heading">Lista de Usuarios</div>
                        <div class="panel-body">
                            <p>Lista de todos los Clientes registrados</p>
                            <!-- Table -->
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Nombre</th>
                                        <th>Apellido</th>
                                        <th>DNI</th>
                                        <th>Usuario</th> 
                                        <th>Password</th>
                                        <th>Tipo Usuario</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% Hashtable listauser = (Hashtable) session.getAttribute("usuarios");
                                        Enumeration usuarios = listauser.elements();
                                        while (usuarios.hasMoreElements()) {
                                            Usuarios user = (Usuarios) usuarios.nextElement();%>

                                    <tr id="user<%=user.getId()%>">
                                        <td><%=user.getId()%></td>
                                        <td><%=user.getNombre()%></td>
                                        <td><%=user.getApellido()%></td>   
                                        <td><%=user.getDNI()%></td>
                                        <td><%=user.getUsuario()%></td>
                                        <td><%=user.getContrasenia()%></td>
                                        <%if (user.getTipoUsr() == 1) {
                                                out.println("<td>Admin</td>");
                                            } else {
                                                out.println("<td>Comun</td>");
                                            }%>
                                        <td><button id="modificar" type="button" data-tipo="<%if (user.getTipoUsr() == 1) {
                                                out.println("admin");
                                            } else {
                                                out.println("comun");
                                            }%>" data-pass="<%=user.getContrasenia()%>" data-user="<%=user.getUsuario()%>" data-nombre="<%=user.getNombre()%>" data-apellido="<%=user.getApellido()%>" data-dni="<%=user.getDNI()%>" data-id="<%=user.getId()%>" class="btn btn-modificar" data-toggle="modal" data-target=".bs-example-modal-sm"><span class="glyphicon glyphicon-edit"></span></button>
                                            <button id="eliminar" type="button" data-user="<%=user.getId()%>" class="btn btn-eliminar"><span class="glyphicon glyphicon-trash"></span></button></td>
                                    </tr>
                                    <% }%>

                                </tbody>
                            </table>
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
        <script src="js/administration.js"></script>
        <script> $(".alert").alert()</script>



    </body>
</html>
<% }%>
