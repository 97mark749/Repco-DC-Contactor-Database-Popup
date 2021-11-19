
$(document).ready(function(){
    $("#search").keyup(function(){
        $.ajax({
            type: "POST",
            url: "autocomplete.php",
            data: 'keyword='+$(this).val(),
            success: function(data){
                alert(data);
                if(data == "" || data == null){
                    alert("here");
                    $('#suggestions').hide();
                    $('#click-txt').hide();            
                }
                else{
                    $('#suggestions').show();
                    $('#suggestions').html(data);
                }
            }
        });
    });
});

$(document).click(function(){
    $('#suggestions').hide();
});



function selectNumber(val){
    $('#search').val(val.innerHTML.replace('<strong>','').replace('</strong>',''));
    $('#suggestions').hide();
}