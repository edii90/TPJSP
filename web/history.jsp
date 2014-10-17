<%-- 
    Document   : history
    Created on : 17/10/2014, 18:57:29
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
        <title>Historial - Ferreteria UTN</title>
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
                    <a class="navbar-brand" href="inicio">Ferreteria</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="inicio"><span class="glyphicon glyphicon-home"></span> Inicio</a></li>
                        <li class="active"><a href="historial">Historial</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="hidden-xs">
                            <a id="cart" href="/checkout"><i class="glyphicon glyphicon-shopping-cart"></i>(0)</a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>  Admin <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">

                                <!-- Validar Administrador-->
                                <li><a href="administrar"><span class="glyphicon glyphicon-cog"></span> Administrar Usuarios</a></li>
                                <!-- -->

                                <li><a href="logout"><span class="glyphicon glyphicon-off"></span> Cerrar Sesion</a></li>
                            </ul>
                        </li>
                    </ul>
                </div><!-- /.nav-collapse -->
            </div><!-- /.container -->
        </div><!-- /.navbar -->     
        <div class="container">

            <br>

            <div class="selector">
                <select class="form-control" id="usuarios">
                    <option value="todos">Todos</option>

                    <!-- Servlet Cargar Usuarios
                    
                              <option value="user14">Federico Lopez</option>
                    
                              <option value="user12">Mate Hiper</option>
                    
                              <option value="user11">Lucas Perez</option>
                    
                              <option value="user10">Maximiliano Queiroz</option>
                    
                              <option value="user9">Guillermo Cattaneo</option>
                    
                              <option value="user8">Pedro Rodriguez</option>
                    
                              <option value="user7">Luis Hernandez</option>
                    
                              <option value="user6">Julian Garcia</option>
                    
                              <option value="user5">Raul Gonzalez</option>
                    
                              <option value="user4">Juan Garcia</option>
                    
                              <option value="user3">Jose Perez</option>
                    
                              <option value="user2">Leandro Santillan</option>
                    
                              <option value="user1">Administrador</option>
                    -->
                </select>
            </div>
            <hr>

            <div class="panel-group" id="accordion">

                <!-- Servlet Cargar Historial -->

                <div class="panel panel-default user14">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse15">
                                Orden #15  (Total: 439.0) - 2014-09-30
                            </a>
                        </h4>
                    </div>
                    <div id="collapse15" class="panel-collapse collapse in">
                        <div class="panel-body">

                            <div class="row item">
                                <div class="col-sm-2 cell img"><img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="200x200" src="img/noimage.jpg"></div>
                                <div class="col-xs-6 col-sm-6 cell text">
                                    <h4>Nagel</h4>
                                    <div class="descripcion">Clavo de acero cabeza perdida 2.20 x 45 - 40 </div>
                                    <span> $21.95</span><div class="clearfix"></div>
                                </div>
                                <div class="col-xs-3 col-sm-2 cell input">
                                    <strong>Cantidad:</strong><div class="clearfix"></div>
                                    <input name="sku17" type="text" readonly="" class="form-control input-sm input-cant" value="20"><div class="clearfix"></div>
                                </div>
                                <div class="col-xs-3 col-sm-2 cell button">
                                    <strong>Subtotal:</strong><div class="clearfix"></div>
                                    $439.0
                                </div>

                            </div><!-- /.item -->

                        </div><!-- /.panelbody -->
                    </div><!-- /.collapse -->
                </div><!-- /.panel -->
                <!-- /Servlet Cargar Historial -->

            </div><!-- /.panel-group -->


        </div><!-- /.container -->
        <div class="footer navbar-inverse">
            <div class="container">
                <p class="text-muted"><strong>Tp Servlet - Santillan Leandro</strong></p>
            </div><!-- /.container footer-->
        </div>
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script>
            $(document).on("ready", function() {
                $('select#usuarios').on('change', function() {
                    var opt = $(this).val();

                    if (opt != "todos") {
                        $('.panel-group div.panel-default').each(function()
                        {
                            if (!$(this).hasClass(opt))
                            {
                                $(this).hide("fast");
                            }
                            else
                            {
                                $(this).show("slow");
                            }
                        });
                    }
                    else {
                        $('.panel-group div.panel-default').each(function()
                        {
                            $(this).show("slow");
                        });
                    }
                    ;
                });
            })
        </script>
    </body>
</html>
