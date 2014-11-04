$(function() {
    var nombre = "",
            precio = "",
            stock = "",
            img = "";

    $('#reg').on('click', function() {
        nombre = $("#reg-nombre").val();
        precio = $("#reg-precio").val();
        stock = $("#reg-stock").val();
        img = $("#reg-imagen").val();

        $.post('AdaptadoraABMProductos', {nombre: nombre, precio: precio, stock: stock, imagen: img, funcion: 'alta'}, function(data) {
            window.location = data;
        });

    });
});

$(function() {
    var idprod = 0;

    $('.btn-eliminar').on('click', function() {
        idprod = $(this).attr("data-user");
        $.post('AdaptadoraABMProductos', {id: idprod, funcion: 'baja'}, function(data) {
            window.location = data;
        });
    });
});
$(function() {
    var nombre = "",
            precio = "",
            stock = "",
            img = "",
            id = "";

    $('.btn-modificar').on('click', function() {
        id = $(this).attr("data-prod");
        precio = $(this).attr("data-precio");
        nombre = $(this).attr("data-nombre");
        stock = $(this).attr("data-stock");
        img = $(this).attr("data-imagen");

        $('#confirmar').attr('data-id', id);
        $(":input[name='mod-nombre']").val(nombre);
        $(":input[name='mod-precio']").val(precio);
        $(":input[name='mod-stock']").val(stock);
        $(":input[name='mod-imagen']").val(img);
    });
});
$(function() {
    var nombre = "",
            precio = "",
            stock = "",
            img = "",
            id = 0;


    $('#confirmar').on('click', function() {
        id = $(this).attr("data-id");
        nombre = $(":input[name='mod-nombre']").val();
        precio = $(":input[name='mod-precio']").val();
        stock = $(":input[name='mod-stock']").val();
        img = $(":input[name='mod-imagen']").val();
       
        $.post('AdaptadoraABMProductos', {id: id, nombre: nombre, precio: precio, stock: stock, imagen: img, funcion: 'modificacion'}, function(data) {
            window.location = data;
        });
    });
});