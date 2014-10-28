$(function() {
    var idprod = 0,
            cant = 0;

    $('.btn-eliminar').on('click', function() {
        idprod = $(this).attr("data-prod");
        var inp = $(":input[name='sku" + idprod + "']");
        cant = inp.val();
            if (cant == "") {
            inp.focus();
            }
           else {
            $.post('AdaptadoraCarrito', {idprod: idprod, cant: cant, accionCarro: 'E'}, function(data){window.location = data;});
        };
    });
});
$(function() {
    var idprod = 0,
            cant = 0;

    $('.btn-modificar').on('click', function() {
        idprod = $(this).attr("data-prod");
        var inp = $(":input[name='sku" + idprod + "']");
        cant = inp.val();
            if (cant == "") {
            inp.focus();
            }
           else {
            $.post('AdaptadoraCarrito', {idprod: idprod, cant: cant, accionCarro: 'M'}, function(data){window.location = data;});
        };
    });
});
$(function() {
    $('.btn-confirmar').on('click', function() {
            $.post('AdaptadoraABMCompras', {funcion: 'alta'}, function(data){window.location = data;});
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
}),
$(function(){
        $(".input-cant").on("keyup", (function() {
        var cant = parseInt($(this).val());
        if (cant == "") {
            $(this).val("1");                           
        }        
    }));  
});