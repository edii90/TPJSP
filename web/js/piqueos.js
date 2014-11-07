$(function() {
    var idpiqueo = "";
    
    $('#confirmar').on('click', function() {
        idpiqueo = $(this).attr("data-id");
            $.post('ConfirmarPiqueo', {id: idpiqueo}, function(data){window.location = data;});
    });
});