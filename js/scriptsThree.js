$(document).ready(function(){
    $('#close-data-sheet').click(function(){
        $('#popup-window-three').modal('hide');
        $('#popup-window-two').modal('show');
    });
    $('#close-data-sheet-x').click(function(){
        $('#popup-window-three').modal('hide');
        $('#popup-window-two').modal('show');
    });
});

function assign_info(item_num){

    $('#data-sheet-title').html("Catalog No. " + item_num);
}