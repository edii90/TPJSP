$(function() {
    var nombre = "",
            usuario = "",
            email = "",
            pass = "",
            tipo = "";

    $('#reg').on('click', function() {
        nombre = $("#reg-nombre").val();
        usuario = $("#reg-usuario").val();
        email = $("#reg-email").val();
        pass = $("#reg-pass").val();
        if ($("#reg-adm").is(':checked')) {
            tipo = "true";
        } else {
            tipo = "false";
        }

        if (nombre != "" && usuario != "" && pass != "") {
            $.post('administrar', {usuario: usuario, pass: pass, nombre: nombre, email: email, adm: tipo, accionADM: 'R'}, function(data) {
                window.location = data;
            });
        }
        ;
    });
});
$(function() {
    var nombre = "",
            id = 0, 
            usuario = "",
            email = "",
            pass = "",
            tipo = "";

    $('.btn-modificar').on('click', function() {
        id = $(this).attr("data-id");
        usuario = $(this).attr("data-user");
        nombre = $(this).attr("data-nombre");
        email = $(this).attr("data-email");
        pass = $(this).attr("data-pass");
        tipo = $(this).attr("data-tipo");
        $(":input[name='mod-nombre']").val(nombre);
        $(":input[name='mod-usuario']").val(usuario);
        $(":input[name='mod-email']").val(email);
        $(":input[name='mod-pass']").val(pass);
        if(tipo == "Admin")
        {
            $(":input[name='mod-adm']").attr('checked', true);
        }
        else
        {
            $(":input[name='mod-adm']").attr('checked', false);
        }
        $("#confirmar").attr('data-id', id);

        
    });
});
$(function() {
    var iduser = 0;

    $('.btn-eliminar').on('click', function() {
        iduser = $(this).attr("data-user");
        $.post('administrar', {idusuario: iduser, accionADM: 'E'}, function(data) {
            window.location = data;
        });
    });
});
$(function() {
    var nombre = "",
            id = 0, 
            usuario = "",
            email = "",
            pass = "",
            tipo = "";

    $('#confirmar').on('click', function() {
        id = $(this).attr("data-id");
        usuario = $(":input[name='mod-usuario']").val();
        nombre = $(":input[name='mod-nombre']").val();
        email = $(":input[name='mod-email']").val();
        pass = $(":input[name='mod-pass']").val();
        if ($(":input[name='mod-adm']").is(':checked')) {
            tipo = "true";
        } else {
            tipo = "false";
        }
        $.post('administrar', {iduser: id, usuario: usuario, pass: pass, nombre: nombre, email: email, adm: tipo, accionADM: 'M'}, function(data) {
                window.location = data;
            });
    });
});