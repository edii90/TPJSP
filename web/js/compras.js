$(function() {
    var idcompra = 0,
    opcion=0;
            

    $('.btn-modificar').on('click', function() {
        idcompra = $(this).attr("data-compra");
        opcion = $("#estado").val();
            if (opcion == 3) {
            $.post('AdaptadoraABMCompras', {id: idcompra, funcion: 'confirmar'}, function(data){window.location = data;});
            }
           else if (opcion == 2) {
            $.post('AdaptadoraABMCompras', {id: idcompra, funcion: 'rechazar'}, function(data){window.location = data;});
        }else if (opcion == 1)
        {
            alert("No se puede poner la Compra en estado Pendiente")
        };
    });
});