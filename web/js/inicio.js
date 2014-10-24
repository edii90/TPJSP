/*$(function() {
    var $container = $('#contenedor');

    $container.mixItUp({
        animation: {
            animateResizeTargets: true, // Animate the width/height of targets as the layout changes
            effects: 'fade rotateX(-40deg) translateZ(-100px)'
        }
    });

});*/

$(function() {
    var search = 'glyphicon glyphicon-search',
            remove = 'glyphicon glyphicon-remove',
            $icono = $('#iconbuscar'),
            $boton = $('#buscar'),
            bool = $icono.attr("data-opt");


    $boton.on('click', function() {
        var $filtro = $('#busqueda').val();
        if ($filtro == "") {
            $('#busqueda').focus();
        }
        else
        {
            if (bool == 'false') {
                $.post('listarproductos', {filtro: $filtro, todos: 'false'}, function(data){
                  window.location = data;
                });
            } else {
                $.post('listarproductos', {todos: 'true'}, function(data){
                  window.location = data;
                });
            }
            ;
        }
        ;
    });
});
$(function() {
    var idprod = 0,
            items = 0,
            icon = '<i class="glyphicon glyphicon-shopping-cart"></i>',
            cant = 0;

    $('.btn-comprar').on('click', function() {
        idprod = $(this).attr("data-prod");
        var inp = $(":input[name='sku" + idprod + "']");
        cant = inp.val();
        if (cant == "") {
            inp.focus();
            exit();
        }
        else {
            $.post('carrito', {idprod: idprod, cant: cant, accionCarro: 'A'}, function(data)
            {
                $('#cart').html(icon + '(' + data + ')');
            });
            inp.val("");

        }
        ;

    });

});
$(function() {
    $(".input-cant").on("keydown", (function(event) {
        if (event.shiftKey)
        {
            event.preventDefault();
        }
        if (event.keyCode == 46 || event.keyCode == 8) {
        }
        else {
            if (event.keyCode < 95) {
                if (event.keyCode < 48 || event.keyCode > 57) {
                    event.preventDefault();
                }
            }
            else {
                if (event.keyCode < 96 || event.keyCode > 105) {
                    event.preventDefault();
                }
            }
        }
    }));
});
