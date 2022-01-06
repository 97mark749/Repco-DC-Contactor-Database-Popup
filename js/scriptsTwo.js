$(document).ready(function(){
    $('#close-cross-ref').click(function(){
        $('#popup-window-two').modal('hide');
        $('#popup-window-one').modal('hide');
    });
    $('#close-cross-ref-x').click(function(){
        $('#popup-window-two').modal('hide');
        $('#popup-window-one').modal('hide');
    });
    $('#search-switch-btn').click(function(){
        $('#popup-window-two').modal('hide');
        $('#popup-window-one').modal('show');
    });
});

function set_dropdowns(){
    let select = document.getElementById('selectManufacturer');
    let value = select.options[select.selectedIndex].value;
    $.ajax({
        type:'POST',
        url: 'cross-ref.php',
        data: {selectManufacturer: value},
        success: function(data){
            enable('selectSeries');
            $('#results-body').html('<div class ="UserDirections">Select The Specifications For Your DC Contactor</div>');
            $('#selectSeries').html(data);
        }
    });
}

function set_remaining_dropdowns(){
    let select = document.getElementById('selectSeries');
    let value = select.options[select.selectedIndex].value;
    $.ajax({
        type:'POST',
        url: 'cross-ref.php',
        data: {selectSeries: value},
        success: function(data){
            $('#remaining-dropdowns').html(data);
        }
    });
}

function filter_search(text){
    let select = document.getElementById(text);
    let name = select.getAttribute("name");
    let value = select.options[select.selectedIndex].value;
    //sends request to process the property clicked on by user from id 'text' --> POST method passes 'value' to PHP
    $.ajax({
        type:'POST',
        url: 'cross-ref.php',
        data: {property: [text, value, name]},
        success: function(data){
            // (data) returns value of size of contactor
            switch(text){
                // enables the next dropdown
                case 'property2':enable('submit-search');enable('property3');enable('optProp3');break;
                case 'property3':enable('property4');enable('optProp4');break;
                case 'property4':enable('property5');enable('optProp5');break;
                case 'property5':enable('property6');enable('optProp6');break;
                case 'property6':enable('property7');enable('optProp7');break;
                case 'property7':enable('property8');enable('optProp8');break;
                case 'property8':enable('property9');enable('optProp9');break;
                case 'property9':enable('property10');enable('optProp10');break;
                default:break;
            }
            // Another AJAX Call to delete Session logs
            // Sends the property Name to start iterating through then returns the 
            $.ajax({
                type: "POST",
                url: 'cross-ref.php',
                datatype: 'json',
                data: {position: text.substring(text.length-1)}, // passes the position property to php server
                success: function(data){
                    // returns number of dropdowns
                    var pos = JSON.parse(data);
                    var new_pos = parseInt(text.substring(text.length-1)) + 1; // last position + 1
                    try{
                        while(new_pos <= data){
                            $('#property'+new_pos).get(0).selectedIndex = 0;
                            new_pos+=1;
                            //while the property exists
                            //$('#property'+i+' option:selected').removeAttr('selected');
                        }
                    }
                    catch(e){
                        console.log("Something is Wrong -->" + e);
                    }
                }
            });
            if(data !== ''){
                // if the size selector is not null (current slection)
                filter_options(data);
            }
        
        }
    });
    
}

function filter_options(size){
    $.ajax({
        type: 'POST',
        url: 'cross-ref.php',
        data: {filter: size},
        success: function(data){
            let array = jQuery.parseJSON(data);
            for(let i = 0; i < array.length; i++){
                checkExists(array[i]);
            }
        }
    });
}

function checkExists(array){
    $('#'+array[0]+' > option').each(function(){
        //for each option in the dropdown selected, check if the option exists in the selected size array
        if(jQuery.inArray(this.value,array) === -1){
            // If option is not inside the selected size array --> Disable the option selection
            $('#'+array[0]+' option[value="'+this.value+'"]').attr('disabled',true);
        }
        else{
            $('#'+array[0]+' option[value="'+this.value+'"]').attr('disabled',false);
        }
    });
}

function print_filtered_nums(){
    $.ajax({
        type: "POST",
        url: "cross-ref.php",
        data: {print_nums:'Print'},
        success: function(data){
            $('#results-body').html(data);
        }
    });
}

function enable(id){
    document.getElementById(id).disabled = false;
}
function disable(id){
    document.getElementById(id).disabled = true;

}

function reset_form(){
    $(document).ready(function(){
        sessionStorage.clear();
        window.localStorage.clear();
        $('#selectManufacturer').get(0).selectedIndex = 0;
        $('#selectSeries').get(0).selectedIndex = 0;
        disable('selectSeries');
        disable('submit-search');
        $("#remaining-dropdowns").html('');
        $('#results-body').html('');
        $.ajax({
            type: 'POST',
            url:'cross-ref.php',
            data: {cancel: "cancel"},
            success: function(){
                return;
            }
        });
    });  
}
