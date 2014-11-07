$(function() {
    var idpiqueo = "";
    
    $('#confirmar').on('click', function() {
        idpiqueo = $("#confirmar").attr("data-id");
            $.post('ConfirmarPiqueo', {idp: idpiqueo}, function(data){window.location = data;});
    });
});