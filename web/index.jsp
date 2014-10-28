<%-- 
    Document   : index
    Created on : 30/09/2014, 20:45:21
    Author     : Edii
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
        <title>Iniciar Sesion - Ferreteria UTN</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-theme.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <script>
            function ocultar(){ $('#mensaje').hide('slow');}
            function Validar() {
                if (formulario.usuario.value == '')
                {
                    $('#mensaje').show();
                    document.getElementById('error').innerHTML = 'El nombre de usuario no puede estar vacio';
                    document.getElementById('usuario').focus();
                    var t = setTimeout("ocultar()", 3000);
                    exit();
                }
                if (formulario.usuario.value.length < 4)
                {
                    $('#mensaje').show();
                    document.getElementById('error').innerHTML = 'El nombre debe tener mas de cuatro caracteres';
                    document.getElementById('usuario').focus();
                    var t = setTimeout("ocultar()", 3000);
                    exit();
                }
                if (formulario.pass.value == '')
                {
                    $('#mensaje').show();
                    document.getElementById('error').innerHTML = 'La contraseña no puede estar vacia';
                    document.getElementById('pass').focus();
                    var t = setTimeout("ocultar()", 3000);
                    exit();
                }
                if (formulario.pass.value.length < 4)
                {
                    $('#mensaje').show();
                    document.getElementById('error').innerHTML = 'La contraseña debe tener mas de cuatro caracteres';
                    document.getElementById('pass').focus();
                    var t = setTimeout("ocultar()", 3000);
                    exit();
                }
                formulario.submit();
            }
            function submitenter(pag, e)
            {
                var keycode;
                if (window.event)
                    keycode = window.event.keyCode;
                else if (e)
                    keycode = e.which;
                else
                    return true;

                if (keycode == 13)
                {
                    Validar();
                    return false;
                }
                else
                    return true;
            }
        </script>
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <a class="navbar-brand " href="#">Ferreteria </a>
                </div>

            </div><!-- /.container -->
        </nav>
        <div class="container">
            <form class="form-signin" name="formulario" action="AdaptadoraLogin" method="post">
                <h2 class="form-signin-heading">Iniciar Sesion</h2>
                <input type="text" id="usuario" name="usuario" class="form-control" placeholder="Nombre de Usuario" required="" autofocus="" maxlength="10">
                <input type="password" id="pass" name="pass" class="form-control" placeholder="Password" required="" onkeypress="return submitenter(this, event)" maxlength="20">
                <input class="btn btn-lg btn-primary btn-block" type="button" onclick="javascript:Validar();" value="Login">
            </form>


            <div id="mensaje" class="alert alert-error mensaje"><strong id="error">
                <% if (session.getAttribute("ErrorLogin") != null) { String msj = (String) session.getAttribute("ErrorLogin"); out.println(msj); }%></strong>
            </div>



        </div>
        <div id="crossfade">
            <img src="img/image1.jpg" alt="Image 1">
            <img src="img/image2.jpg" alt="Image 2">
            <img src="img/image3.jpg" alt="Image 3">
            <img src="img/image4.jpg" alt="Image 4">
            <img src="img/image5.jpg" alt="Image 5">
        </div><div class="footer navbar-inverse">
            <div class="container">
                <p class="text-muted"><strong>Tp Servlet - Santillan Leandro</strong></p>
            </div>
        </div>
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <% if (session.getAttribute("ErrorLogin") != null) {%>
        <script>
                    $('#mensaje').show();
                    $('#mensaje').alert();

        </script>
        <% } else {%>
        <script>
                    $('#mensaje').hide();
        </script>
        <% } %>


    </body>
</html>
