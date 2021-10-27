let temp = "None";


try{
    $(document).ready(function(){
        $("#submit").click(function(e){submit_search(e);});
    });
}catch(error){
    console.log("Submit Button Will Not Work.")
}

try{
    $(document).on('keypress', function(event){
        if(event.keyCode === 13){submit_search(event);}
    });
}catch(error){
    console.log("Search Not Successful.")
}

function load_data(type, cat_num_str){
    $.ajax({
        type: "POST",
        url: "search.php",
        data:{type:cat_num_str},
        success: function(data){

        }
    });
}

function submit_search(e){
    e.preventDefault();
    cont_num = $("#search").val();
    $.ajax({
        type: "GET",
        url: "search.php",
        data: {search:cont_num},
        cache: false,
        success: function(data){
            temp = data;
            $("#result").html(data);
            validate_replacement();
            validate_input();
            $(".results-box").show();
        }
    });
}

function clear_form(){
    document.getElementById("form").reset();
    $(".results-box").hide();
    $('#result').html("");
    $('#repcoResult').html("");
    validate_input();
}

function validate_replacement(){
    try{
        $.ajax({
            type:'GET',
            url: 'search.php',
            data:{ valid: "validate"},
            success: function(data){
            if(temp=="Please Enter A Valid Catalog Number!"){$("#repcoResult").html("");}
            else{$("#repcoResult").html(data); get_link();
            }
            }
        });
    }catch(e){
        
    }
}

function get_link(){
    $(document).ready(function(){
        $("#website_nav").click(function(e){
            e.preventDefault();
            $.ajax({
                type: 'GET',
                url: 'search.php',
                data: {website_nav:'1'},
                success: function(data){
                    window.location.replace(data);
                }    
            });
        });
    }); 
}

function validate_input() {
    if(document.getElementById("search").value===""){document.getElementById('submit').disabled = true;} 
    else { document.getElementById('submit').disabled = false;}
}

    