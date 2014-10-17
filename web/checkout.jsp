<%-- 
    Document   : checkout
    Created on : 17/10/2014, 18:57:42
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
                    <a class="navbar-brand" href="main">Ferreteria</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="main"><span class="glyphicon glyphicon-home"></span> Inicio</a></li>
                        <li><a href="history">Historial</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="hidden-xs active">
                            <a id="cart" href="checkout"><i class="glyphicon glyphicon-shopping-cart"></i>(1)</a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>  Admin <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">

                                <li><a href="administration"><span class="glyphicon glyphicon-cog"></span> Administrar Usuarios</a></li>

                                <li><a href="logout"><span class="glyphicon glyphicon-off"></span> Cerrar Sesion</a></li>
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
                        <!-- Servlet Cargar Detalles de Compra
                                  <div class="row item">
                                    <div class="col-sm-2 cell img"><img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="200x200" src="img/trefilcon.jpg"></div>
                                    <div class="col-xs-6 col-sm-6 cell text">
                                      <h4>Trefilcon</h4>
                                      <div class="descripcion">Cable Unipolar 2.5 mm2 Negro</div>
                                      <span> $6.5</span><div class="clearfix"></div>
                                    </div>
                                    <div class="col-xs-3 col-sm-2 cell input">
                                      <strong>Cantidad:</strong><div class="clearfix"></div>
                                      <input name="sku17" type="text" class="form-control input-sm input-cant" placeholder="9999" value="1"><div class="clearfix"></div>
                                    </div>
                                    <div class="col-xs-3 col-sm-2 cell button">
                                      <button id="modificar" type="button" data-prod="17" class="btn btn-modificar"><span class="glyphicon glyphicon-floppy-disk"></span></button>
                                      <button id="eliminar" type="button" data-prod="17" class="btn btn-eliminar"><span class="glyphicon glyphicon-trash"></span></button>
                                    </div>
                                  </div><!-- /.item -->


                    </div><!-- /.panelbody -->
                </div><!-- /.detalles -->
                <div class="col-sm-2 col-md-4 lateral">
                    <div class="row cuadro">
                        <h1>TOTAL:</h1>
                        <div class="well"><h3>$6.5</h3></div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="row cuadro">
                        <div class="col-xs-6"><button id="seguir" type="button" class="btn btn-seguir"><a href="inicio">Seguir Comprando</a></button></div>
                        <div class="col-xs-6"><button id="confirmar" type="button" class="btn btn-confirmar">Confirmar</button></div>
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
        <script src="js/checkout.js"></script>
    </body>
</html>
