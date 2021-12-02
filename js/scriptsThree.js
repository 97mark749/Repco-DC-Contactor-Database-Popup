$(document).ready(function(){
    $('#close-data-sheet').click(function(){
        $('#popup-window-three').modal('hide');
        $('#popup-window-two').modal('show');
    });
    $('#close-data-sheet-x').click(function(){
        $('#popup-window-three').modal('hide');
        $('#popup-window-two').modal('show');
    });
    /*$('#data-sheet-nav-btn').click(function(){
        $('#data-sheet-nav-arrow').css("transform", "scale(0.95)");
    });*/
});

function assign_info(id){
    $('#data-sheet-title').html("Contactor No. <u>" + id + "</u>");
    $.ajax({
        type: "POST",
        url: 'cross-ref.php',
        data: {number: id},
        success: function(data){
            // Needed to make this a literal hard coded input.
            // Prewrote thhe initial file location
            // SubStringed the '..' from the POSTed link
            $('#data-sheet-body').html('<iframe src="/repco-dc-contactor-database-popup/docs/' + String(JSON.parse(data)) + '"></iframe>');
        }
    });
}
