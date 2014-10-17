<%-- 
    Document   : main
    Created on : 17/10/2014, 18:56:24
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
                    <a class="navbar-brand" href="inicio">Ferreteria</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="inicio"><span class="glyphicon glyphicon-home"></span> Inicio</a></li>
                        <li><a href="historial">Historial</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="hidden-xs">
                            <a id="cart" href="checkout"><i class="glyphicon glyphicon-shopping-cart"></i>(0)</a>
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
            <div class="row">
                <div class="col-xs-4 col-sm-3 col-md-2 sidebar">
                    <ul class="nav nav-sidebar">
                        <br>
                        <li>
                            <div class="input-group">
                                <input type="text" class="form-control" id="busqueda" name="busqueda" placeholder="Producto">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" id="buscar" type="button"><span id="iconbuscar" data-opt="false" class="glyphicon glyphicon-search"></span></button>
                                </span>
                            </div><!-- /input-group -->                    
                        </li>

                        <br>
                        <li><button class="filter btn-block active" data-filter="all">Todos</button></li>

                        <!-- Servlet Cargar Categorias
                        
                                    <li><button class="filter btn-block" data-filter=".cat6">Fijaciones y Tornillería</button></li>
                        
                                    <li><button class="filter btn-block" data-filter=".cat5">Cerrajería</button></li>
                        
                                    <li><button class="filter btn-block" data-filter=".cat4">Plomería</button></li>
                        
                                    <li><button class="filter btn-block" data-filter=".cat3">Electricidad</button></li>
                        
                                    <li><button class="filter btn-block" data-filter=".cat2">Maquinaria</button></li>
                        
                                    <li><button class="filter btn-block" data-filter=".cat1">Herramientas</button></li> -->

                    </ul>
                </div>
                <div class="col-xs-8 col-sm-9 col-md-10 main pull-right">
                    <h1 class="page-header">Productos</h1>

                    <div class="row placeholders" id="contenedor">
                        <!-- Servlet Cargar Productos
                        
                                <div class="col-xs-12 col-sm-6 placeholder mix cat3" data-myorder="17" style="display: inline-block;">
                                   <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="200x200" src="img/trefilcon.jpg">
                                   <h4>Trefilcon</h4><div class="clearfix"></div>
                                   <div class="descripcion">Cable Unipolar 2.5 mm2 Negro</div><div class="clearfix"></div>
                                   <span> $6.5</span><div class="clearfix"></div>
                                   <input name="sku17" type="text" class="form-control input-sm input-cant" placeholder="Cantidad"><div class="clearfix"></div>
                                   <button id="comprar" type="button" data-prod="17" class="btn-sm btn-comprar"><strong>Comprar</strong></button>
                                </div>
                                <div class="col-xs-12 col-sm-6 placeholder mix cat4" data-myorder="16" style="display: inline-block;">
                                   <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="200x200" src="img/sifolimp.jpg">
                                   <h4>Sifolimp</h4><div class="clearfix"></div>
                                   <div class="descripcion">Canilla esférica PVC 1/2" con Manga Mariposa</div><div class="clearfix"></div>
                                   <span> $18.9</span><div class="clearfix"></div>
                                   <input name="sku16" type="text" class="form-control input-sm input-cant" placeholder="Cantidad"><div class="clearfix"></div>
                                   <button id="comprar" type="button" data-prod="16" class="btn-sm btn-comprar"><strong>Comprar</strong></button>
                                </div>
                                <div class="col-xs-12 col-sm-6 placeholder mix cat3" data-myorder="15" style="display: inline-block;">
                                   <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="200x200" src="img/epuyen.jpg">
                                   <h4>Epuyen</h4><div class="clearfix"></div>
                                   <div class="descripcion">Cable telefónico exterior fachada 2 x 0.61 mm</div><div class="clearfix"></div>
                                   <span> $5.5</span><div class="clearfix"></div>
                                   <input name="sku15" type="text" class="form-control input-sm input-cant" placeholder="Cantidad"><div class="clearfix"></div>
                                   <button id="comprar" type="button" data-prod="15" class="btn-sm btn-comprar"><strong>Comprar</strong></button>
                                </div>
                                <div class="col-xs-12 col-sm-6 placeholder mix cat4" data-myorder="14" style="display: inline-block;">
                                   <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="200x200" src="img/tigre.jpg">
                                   <h4>Tigre</h4><div class="clearfix"></div>
                                   <div class="descripcion">Válvula Esférica Pvc de 1/2"</div><div class="clearfix"></div>
                                   <span> $19.2</span><div class="clearfix"></div>
                                   <input name="sku14" type="text" class="form-control input-sm input-cant" placeholder="Cantidad"><div class="clearfix"></div>
                                   <button id="comprar" type="button" data-prod="14" class="btn-sm btn-comprar"><strong>Comprar</strong></button>
                                </div>
                                <div class="col-xs-12 col-sm-6 placeholder mix cat4" data-myorder="13" style="display: inline-block;">
                                   <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="200x200" src="img/awaduct.jpg">
                                   <h4>Awaduct</h4><div class="clearfix"></div>
                                   <div class="descripcion">Tubo junta elástica 110 x 2 m</div><div class="clearfix"></div>
                                   <span> $126.0</span><div class="clearfix"></div>
                                   <input name="sku13" type="text" class="form-control input-sm input-cant" placeholder="Cantidad"><div class="clearfix"></div>
                                   <button id="comprar" type="button" data-prod="13" class="btn-sm btn-comprar"><strong>Comprar</strong></button>
                                </div>
                                <div class="col-xs-12 col-sm-6 placeholder mix cat4" data-myorder="12" style="display: inline-block;">
                                   <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="200x200" src="img/acquasystem.jpg">
                                   <h4>Acqua System</h4><div class="clearfix"></div>
                                   <div class="descripcion">Unión fusión 20 mm</div><div class="clearfix"></div>
                                   <span> $2.9</span><div class="clearfix"></div>
                                   <input name="sku12" type="text" class="form-control input-sm input-cant" placeholder="Cantidad"><div class="clearfix"></div>
                                   <button id="comprar" type="button" data-prod="12" class="btn-sm btn-comprar"><strong>Comprar</strong></button>
                                </div>
                                <div class="col-xs-12 col-sm-6 placeholder mix cat4" data-myorder="11" style="display: inline-block;">
                                   <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="200x200" src="img/amanco.jpg">
                                   <h4>Amanco</h4><div class="clearfix"></div>
                                   <div class="descripcion">Rosca con Tuerca 1/2"</div><div class="clearfix"></div>
                                   <span> $2.7</span><div class="clearfix"></div>
                                   <input name="sku11" type="text" class="form-control input-sm input-cant" placeholder="Cantidad"><div class="clearfix"></div>
                                   <button id="comprar" type="button" data-prod="11" class="btn-sm btn-comprar"><strong>Comprar</strong></button>
                                </div>
                                <div class="col-xs-12 col-sm-6 placeholder mix cat3" data-myorder="10" style="display: inline-block;">
                                   <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="200x200" src="img/lighthouse.jpg">
                                   <h4>Light House</h4><div class="clearfix"></div>
                                   <div class="descripcion">Fotocontrol universal fijo F5 1500 W 2 cables</div><div class="clearfix"></div>
                                   <span> $99.0</span><div class="clearfix"></div>
                                   <input name="sku10" type="text" class="form-control input-sm input-cant" placeholder="Cantidad"><div class="clearfix"></div>
                                   <button id="comprar" type="button" data-prod="10" class="btn-sm btn-comprar"><strong>Comprar</strong></button>
                                </div>
                                <div class="col-xs-12 col-sm-6 placeholder mix cat3" data-myorder="9" style="display: inline-block;">
                                   <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="200x200" src="img/sica.jpg">
                                   <h4>Sica</h4><div class="clearfix"></div>
                                   <div class="descripcion">Disyuntor 2 x 40 A 30 Ma</div><div class="clearfix"></div>
                                   <span> $349.0</span><div class="clearfix"></div>
                                   <input name="sku9" type="text" class="form-control input-sm input-cant" placeholder="Cantidad"><div class="clearfix"></div>
                                   <button id="comprar" type="button" data-prod="9" class="btn-sm btn-comprar"><strong>Comprar</strong></button>
                                </div>
                                <div class="col-xs-12 col-sm-6 placeholder mix cat5" data-myorder="8" style="display: inline-block;">
                                   <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="200x200" src="img/rialpa.jpg">
                                   <h4>Rialpa</h4><div class="clearfix"></div>
                                   <div class="descripcion">Manija biselada doble balancín aluminio pulid</div><div class="clearfix"></div>
                                   <span> $49.95</span><div class="clearfix"></div>
                                   <input name="sku8" type="text" class="form-control input-sm input-cant" placeholder="Cantidad"><div class="clearfix"></div>
                                   <button id="comprar" type="button" data-prod="8" class="btn-sm btn-comprar"><strong>Comprar</strong></button>
                                </div>
                                <div class="col-xs-12 col-sm-6 placeholder mix cat1" data-myorder="7" style="display: inline-block;">
                                   <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="200x200" src="img/black&amp;decker.jpg">
                                   <h4>Black &amp; Decker</h4><div class="clearfix"></div>
                                   <div class="descripcion">Amoladora 4.5" 820 w G720N</div><div class="clearfix"></div>
                                   <span> $425.0</span><div class="clearfix"></div>
                                   <input name="sku7" type="text" class="form-control input-sm input-cant" placeholder="Cantidad"><div class="clearfix"></div>
                                   <button id="comprar" type="button" data-prod="7" class="btn-sm btn-comprar"><strong>Comprar</strong></button>
                                </div>
                                <div class="col-xs-12 col-sm-6 placeholder mix cat1" data-myorder="6" style="display: inline-block;">
                                   <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="200x200" src="img/silvershadow.jpg">
                                   <h4>Silver Shadow</h4><div class="clearfix"></div>
                                   <div class="descripcion">Pinza Universal 6"</div><div class="clearfix"></div>
                                   <span> $80.0</span><div class="clearfix"></div>
                                   <input name="sku6" type="text" class="form-control input-sm input-cant" placeholder="Cantidad"><div class="clearfix"></div>
                                   <button id="comprar" type="button" data-prod="6" class="btn-sm btn-comprar"><strong>Comprar</strong></button>
                                </div>
                                <div class="col-xs-12 col-sm-6 placeholder mix cat2" data-myorder="5" style="display: inline-block;">
                                   <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="200x200" src="img/noimage.jpg">
                                   <h4>Gamma</h4><div class="clearfix"></div>
                                   <div class="descripcion">Soldadora Turbo 265 A</div><div class="clearfix"></div>
                                   <span> $1659.0</span><div class="clearfix"></div>
                                   <input name="sku5" type="text" class="form-control input-sm input-cant" placeholder="Cantidad"><div class="clearfix"></div>
                                   <button id="comprar" type="button" data-prod="5" class="btn-sm btn-comprar"><strong>Comprar</strong></button>
                                </div>
                                <div class="col-xs-12 col-sm-6 placeholder mix cat2" data-myorder="4" style="display: inline-block;">
                                   <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="200x200" src="img/soldadora1.jpg">
                                   <h4>Karson</h4><div class="clearfix"></div>
                                   <div class="descripcion">Soldadora 100 A</div><div class="clearfix"></div>
                                   <span> $899.0</span><div class="clearfix"></div>
                                   <input name="sku4" type="text" class="form-control input-sm input-cant" placeholder="Cantidad"><div class="clearfix"></div>
                                   <button id="comprar" type="button" data-prod="4" class="btn-sm btn-comprar"><strong>Comprar</strong></button>
                                </div>
                                <div class="col-xs-12 col-sm-6 placeholder mix cat2" data-myorder="3" style="display: inline-block;">
                                   <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="200x200" src="img/noimage.jpg">
                                   <h4>Gamma</h4><div class="clearfix"></div>
                                   <div class="descripcion">Soldadora Jet 155 A</div><div class="clearfix"></div>
                                   <span> $985.0</span><div class="clearfix"></div>
                                   <input name="sku3" type="text" class="form-control input-sm input-cant" placeholder="Cantidad"><div class="clearfix"></div>
                                   <button id="comprar" type="button" data-prod="3" class="btn-sm btn-comprar"><strong>Comprar</strong></button>
                                </div>
                                <div class="col-xs-12 col-sm-6 placeholder mix cat6" data-myorder="2" style="display: inline-block;">
                                   <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="200x200" src="img/noimage.jpg">
                                   <h4>Nagel</h4><div class="clearfix"></div>
                                   <div class="descripcion">Clavo de acero cabeza perdida 2.20 x 45 - 40 </div><div class="clearfix"></div>
                                   <span> $21.95</span><div class="clearfix"></div>
                                   <input name="sku2" type="text" class="form-control input-sm input-cant" placeholder="Cantidad"><div class="clearfix"></div>
                                   <button id="comprar" type="button" data-prod="2" class="btn-sm btn-comprar"><strong>Comprar</strong></button>
                                </div>
                                <div class="col-xs-12 col-sm-6 placeholder mix cat6" data-myorder="1" style="display: inline-block;">
                                   <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="200x200" src="img/nagel1.jpg">
                                   <h4>Nagel</h4><div class="clearfix"></div>
                                   <div class="descripcion">Clavo de acero cabeza redonda 2.00 x 24 - 40 </div><div class="clearfix"></div>
                                   <span> $16.25</span><div class="clearfix"></div>
                                   <input name="sku1" type="text" class="form-control input-sm input-cant" placeholder="Cantidad"><div class="clearfix"></div>
                                   <button id="comprar" type="button" data-prod="1" class="btn-sm btn-comprar"><strong>Comprar</strong></button>
                                </div> -->
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
        <script src="js/jquery.mixitup.min.js"></script>
        <script src="js/inicio.js"></script>
    </body>
</html>
