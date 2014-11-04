$(function() {
    var nombre = "",
    apellido="",
            usuario = "",
            dni = "",
            pass = "",
            tipo = "";

    $('#reg').on('click', function() {
        nombre = $("#reg-nombre").val();
        apellido = $("#reg-apellido").val();
        usuario = $("#reg-usuario").val();
        dni = $("#reg-dni").val();
        pass = $("#reg-pass").val();
        if ($("#reg-adm").is(':checked')) {
            tipo = 1;
        } else {
            tipo = 2;
        }

        if (nombre != "" && usuario != "" && pass != "") {
            $.post('ControladoraUsuarios', {usuario: usuario, contraseña: pass, nombre: nombre, apellido: apellido, documento: dni, tipo: tipo, funcion: 'alta'}, function(data) {
                window.location = data;
            });
        }
        ;
    });
});
$(function() {
    var nombre = "",
    apellido = "",
            id = "",
            usuario = "",
            dni = "",
            pass = "",
            tipo = "";

    $('.btn-modificar').on('click', function() {
        id = $(this).attr("data-id");
        usuario = $(this).attr("data-user");
        nombre = $(this).attr("data-nombre");
        apellido = $(this).attr("data-apellido");
        dni = $(this).attr("data-dni");
        pass = $(this).attr("data-pass");
        tipo = $(this).attr("data-tipo");
        $(":input[name='mod-nombre']").val(nombre);
        $(":input[name='mod-apellido']").val(apellido);
        $(":input[name='mod-usuario']").val(usuario);
        $(":input[name='mod-dni']").val(dni);
        $(":input[name='mod-pass']").val(pass);
        $('#confirmar').attr('data-id', id);
        if (tipo == 'admin')
        {
            $(':input[name="mod-adm"]').attr('checked', true);
        }
        else if (tipo == 'comun')
        {
            $(':input[name="mod-adm"]').attr('checked', false);
        }



    });
});
$(function() {
    var iduser = 0;

    $('.btn-eliminar').on('click', function() {
        iduser = $(this).attr("data-user");
        $.post('ControladoraUsuarios', {id: iduser, funcion: 'baja'}, function(data) {
            window.location = data;
        });
    });
});
$(function() {
    var nombre = "",
    apellido = "",
            id = 0,
            usuario = "",
            dni = "",
            pass = "",
            tipo = "";

    $('#confirmar').on('click', function() {
        id = $(this).attr("data-id");
        usuario = $(":input[name='mod-usuario']").val();
        nombre = $(":input[name='mod-nombre']").val();
        apellido = $(":input[name='mod-apellido']").val();
        dni = $(":input[name='mod-dni']").val();
        pass = $(":input[name='mod-pass']").val();
        if ($(":input[name='mod-adm']").is(':checked')) {
            tipo = 1;
        } else {
            tipo = 2;
        }
        $.post('ControladoraUsuarios', {id: id, usuario: usuario, contraseña: pass, nombre: nombre, apellido: apellido, documento: dni, tipo: tipo, funcion: 'modificacion'}, function(data) {
            window.location = data;
        });
    });
});