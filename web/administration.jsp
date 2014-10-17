<%-- 
    Document   : administration
    Created on : 17/10/2014, 19:00:07
    Author     : Leandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Administrar - Ferreteria UTN</title>
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
                    <a class="navbar-brand" href="main">Ferreteria</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="main"><span class="glyphicon glyphicon-home"></span> Inicio</a></li>
                        <li><a href="history">Historial</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="hidden-xs">
                            <a id="cart" href="checkout"><i class="glyphicon glyphicon-shopping-cart"></i>(0)</a>
                        </li>
                        <li class="dropdown active">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>  Admin <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">

                                <li><a href="#"><span class="glyphicon glyphicon-cog"></span> Administrar Usuarios</a></li>

                                <li><a href="logout"><span class="glyphicon glyphicon-off"></span> Cerrar Sesion</a></li>
                            </ul>
                        </li>
                    </ul>
                </div><!-- /.nav-collapse -->
            </div><!-- /.container -->
        </div><!-- /.navbar -->

        <div class="container"> 


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
                                    <label class="sr-only" for="nombre">Nombre y Apellido</label>
                                    <input type="text" class="form-control" name="mod-nombre" id="mod-nombre" placeholder="Nombre y Apellido" autofocus="" required="">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="usuario">Usuario</label>
                                    <input type="text" class="form-control" name="mod-usuario" id="mod-usuario" placeholder="Usuario" required="" maxlength="10">
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">@</div>
                                        <input class="form-control" type="email" name="mod-email" id="mod-email" placeholder="Email" required="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="pass">Password</label>
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
                                    <label class="sr-only" for="nombre">Nombre y Apellido</label>
                                    <input type="text" class="form-control" name="reg-nombre" id="reg-nombre" placeholder="Nombre y Apellido" autofocus="" required="">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="usuario">Usuario</label>
                                    <input type="text" class="form-control" name="reg-usuario" id="reg-usuario" placeholder="Usuario" required="" maxlength="10">
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">@</div>
                                        <input class="form-control" type="email" name="reg-email" id="reg-email" placeholder="Email" required="">
                                    </div>
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
                                        <th>Nombre y Apellido</th>
                                        <th>Usuario</th>
                                        <th>Email</th>
                                        <th>Password</th>
                                        <th>Tipo Usuario</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Servlet Cargar Usuarios
                                                        <tr id="user1">
                                                          <td>1</td>
                                                          <td>Administrador</td>
                                                          <td>admin</td>
                                                          <td>administrador@administrador.com</td>
                                                          <td>admin</td>
                                                          <td>Admin</td>
                                                          <td><button id="modificar" type="button" data-tipo="Admin" data-pass="admin" data-user="admin" data-nombre="Administrador" data-email="administrador@administrador.com" data-id="1" class="btn btn-modificar" data-toggle="modal" data-target=".bs-example-modal-sm"><span class="glyphicon glyphicon-edit"></span></button>
                                                  <button id="eliminar" type="button" data-user="1" class="btn btn-eliminar"><span class="glyphicon glyphicon-trash"></span></button></td>
                                                        </tr>
                                    -->
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
        <script src="js/administrar.js"></script>
        <script> $(".alert").alert()</script>



    </body>
</html>
