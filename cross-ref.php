<?php
    
    include('config.php');
    session_start();

    if(ISSET($_POST['selectManufacturer'])){
        $manufacturer = preg_replace("#[^0-9a-z]#i "," ", $_POST['selectManufacturer']);     
        insertSeriesDropdown($manufacturer);
    }

    if(ISSET($_POST['selectSeries'])){
        $series = preg_replace("#[^0-9a-z]#i ","", $_POST['selectSeries']);
        $_SESSION['prop_1'] = $series;
        $dropdowns = retrieveDropdowns($series);
        insertDropdowns($series,$dropdowns);

    }
    
    if(ISSET($_POST['property'])){
        $target_property = $_POST['property'][0];
        $target_value = $_POST['property'][1];
        $table_name = $_POST['property'][2];

        //passes 'position', 'value'
        if($target_value != 'None'){$recorded_symbol = getSymbol($table_name,$target_value);}
        else{$recorded_symbol = 'None';}
        set_symbol($target_property, $recorded_symbol); //sets symbol session

        //encodes and converts array to string for filtered list of catalog numbers based on total recorded symbols
        $_SESSION['filtered_array'] = json_encode(filter_catalog_numbers());
        
        if($table_name == 'NEMA_Size'){
            echo $target_value; //sends value back to JS File
        }

        /*
        if(ISSET($_POST['check'])){
            // If a series has been chosen...
            switch($_SESSION['prop_1']){
                case 'C80':
                    // if property is lh_auxiliary_contacts & auxiliary_contact_location is not B...
                    switch($target_property){
                        case 'property6':
                            if($target_value == 'None'){
                                echo json_encode(array('property8','property9'));
                            }
                        case 'property8':
                            if($_SESSION['prop_7'] != 'B'){
                                // If No value for the lh_auxiliary was chosen then ignore function...
                                if($target_value == 'None' || $target_value == 'No Value'){
                                    break;
                                }else{
                                    // return the name of the rh_auxiliary dropdown in order to disable it since one sided (A) was chosen in dropdown 7
                                    echo json_encode('property9');
                                }
                            }
                        default:break;
                    }
                    break;
                case 'C82':
                    break;
                default: break;
            }
        }
        */
    }

    if(ISSET($_POST['filter'])){
        $size = $_POST['filter'];
        echo getFilteredValues($size);
    }

    if(ISSET($_POST['cancel'])){
        $_SESSION['prop_1'] = Null;
        $_SESSION['prop_2'] = Null;
        $_SESSION['prop_3'] = Null;
        $_SESSION['prop_4'] = Null;
        $_SESSION['prop_5'] = Null;
        $_SESSION['prop_6'] = Null;
        $_SESSION['prop_7'] = Null;
        $_SESSION['prop_8'] = Null;
        $_SESSION['prop_9'] = Null;
        $_SESSION['prop_10'] = Null;
        $_SESSION['filtered_array'] = Null;
    }
    

    if(ISSET($_POST['print_nums'])){
        print_filtered_list($_SESSION['filtered_array']);
    }

    function insertSeriesDropdown($info){
        $query = mysqli_query($GLOBALS['connection'], "SELECT DISTINCT Series FROM contactor_numbers WHERE Manufacturer LIKE '%$info%'");
        $count = mysqli_num_rows($query);
        if($count == 0){
            return 'No Search Available';
        }
        else{
            echo'<option value="none" selected disabled hidden>Series</option>';
            while($labels = mysqli_fetch_array($query)){
                echo '<option value="'.$labels['Series'].'" class="dropdown-item">'.$labels['Series'].'</option>';
            }
        }
        mysqli_close($GLOBALS['connection']);
    }

    function retrieveDropdowns($series_name){
        $query = mysqli_query($GLOBALS['connection'],"SELECT Table_Name FROM series_tables WHERE Series_Name LIKE '%$series_name%'");
        $count = mysqli_num_rows($query);
        if($count == 0){
            return 'No such result';
        }
        else{
            $row = mysqli_fetch_array($query);
            $table_name = $row['Table_Name'];
            $queryTwo = mysqli_query($GLOBALS['connection'], "SHOW COLUMNS FROM $table_name");
            $countTwo = mysqli_num_rows($queryTwo);
            if($countTwo == 0){
                return 'No such result';
            }
            else{
                while($rows = $queryTwo->fetch_assoc()){
                    // Fetch Column Name and replace invalid characters
                    $columns[] = str_replace("_", " ", $rows['Field']);
                } 
                return $columns;    // RETURNS THE COLUMN ARRAY
            }
        }
        mysqli_close($GLOBALS['connection']);
    }

    function insertDropdowns($series, $dd_Headers){
            for($i=2; $i<sizeof($dd_Headers);$i++){
                //replaces underscores in headers with spaces / Creates dropdowns
                $mod_header = str_replace(" ", "_",$dd_Headers[$i]);
                $tagged_tb_name = strtolower(strval($series.$mod_header));
                if($i == 2){
                    echo'<div class="dropdown-area"><label class="dropdown-label">'.$dd_Headers[$i].':</label><select id="property'.$i.'" name="'.$mod_header.'"class="btn dropdown-btn dropdown-toggle dropdown-button" data-bs-toggle="dropdown" data-bs-display="static" aria-expand="false" onchange="filter_search(this.id)"><option value="none" selected disabled hidden>Click Here</option>';
                    echo '<option id="optProp'.$i.'" value="None" class="dropdown-item">No Value</option>';
                }else{
                    echo'<div class="dropdown-area"><label class="dropdown-label">'.$dd_Headers[$i].':</label><select id="property'.$i.'" name="'.$mod_header.'"class="btn dropdown-btn dropdown-toggle dropdown-button" data-bs-toggle="dropdown" data-bs-display="static" aria-expand="false" onchange="filter_search(this.id)" disabled><option value="none" selected disabled hidden>Click Here</option>';
                    echo '<option id="optProp'.$i.'" value="None" class="dropdown-item">No Value</option>';
                }
                insertOptions($GLOBALS['connection'], $tagged_tb_name); // Inserts options into the created dropdown

                echo '</select></div>';
            }
    }

    function insertOptions($db, $table_name){
            $sql = "SELECT DISTINCT Value FROM $table_name";
            
            $query = mysqli_query($db, $sql) or print(mysqli_error($db));
            if(mysqli_num_rows($query)){
                while($labels = mysqli_fetch_array($query)){
                    echo '<option value="'.$labels['Value'].'" class="dropdown-item">'.$labels['Value'].'</option>';
                }
            }
    }

    function getFilteredValues($value){
        // If $value is not NULL and not equal None
        if(ISSET($value)){
            $size_col = strval('Size_'.$value);
            switch($_SESSION['prop_1']){
                //based on size query the columns of each table that needs to be adjusted
                case 'DS303':
                    $a1 = get_options_by_size($GLOBALS['connection'],'property4','ds303contact_pole_configuration',$size_col);
                    $a2 = get_options_by_size($GLOBALS['connection'],'property6','ds303blowout_coil_rating',$size_col);
                    $a3 = get_options_by_size($GLOBALS['connection'],'property7','ds303nc_blowout_coil_rating', $size_col);
                    $a4 = get_options_by_size($GLOBALS['connection'],'property8','ds303coil_voltage', $size_col);
                    $a5 = get_options_by_size($GLOBALS['connection'],'property9','ds303auxiliaries',$size_col);
                    mysqli_close($GLOBALS['connection']);
                    return json_encode(array($a1,$a2,$a3,$a4,$a5)); 
                    break;
                case 'C80':
                    $a1 = get_options_by_size($GLOBALS['connection'], 'property3','c80blowout_coil_rating',$size_col);
                    $a2 = get_options_by_size($GLOBALS['connection'], 'property4','c80power_pole_configuration',$size_col);
                    $a3 = get_options_by_size($GLOBALS['connection'], 'property6','c80type_of_mounting',$size_col);
                    $a4 = get_options_by_size($GLOBALS['connection'], 'property7','c80auxiliary_contact_location',$size_col);
                    $a5 = get_options_by_size($GLOBALS['connection'], 'property8','c80lh_auxiliary_contacts',$size_col);
                    $a6 = get_options_by_size($GLOBALS['connection'], 'property9','c80rh_auxiliary_contacts',$size_col);
                    mysqli_close($GLOBALS['connection']);
                    return json_encode(array($a1,$a2,$a3,$a4,$a5,$a6));
                    break;
                case 'C82':
                    $a1 = get_options_by_size($GLOBALS['connection'],'property3', 'c82blowout_coil_rating', $size_col);
                    $a2 = get_options_by_size($GLOBALS['connection'], 'property6', 'c82type_of_mounting', $size_col);
                    $a3 = get_options_by_size($GLOBALS['connection'], 'property8', 'c82auxiliary_contact_location', $size_col);
                    mysqli_close($GLOBALS['connection']);
                    return json_encode(array($a1, $a2, $a3));
                    break;
                default:
                    break;
            }
        }
        else{
            return; // Do Not Do Anything!
        }
    }
    function get_options_by_size($db,$id,$table_name, $col){
        //Connect DB --> Perform Query --> Check if Valid/Not Null --> feed into ajax to perform JS script
        $query = mysqli_query($db,"SELECT DISTINCT Value,$col FROM $table_name ORDER BY Value") or die(mysqli_error($db));
        $count = mysqli_num_rows($query);
        if($count == 0){
            return 'No such result';
        }
        else{
            $result = array($id);
            while($row = mysqli_fetch_assoc($query)) {
                if($row[$col] == 1){
                    array_push($result, $row['Value']);
                }

            }
            return $result;
        }
    }

    function getSymbol($table_name, $value){ //passes 'series', 'position', 'value'
            $tb_name = strtolower($_SESSION['prop_1'].$table_name);
            $query = mysqli_query($GLOBALS['connection'], "SELECT Symbol FROM $tb_name WHERE Value LIKE '%$value%'");
            $count = mysqli_num_rows($query);
            if($count == 0){
                return 'No such result';
            }
            else{
                $query_array = mysqli_fetch_array($query);
                return $query_array['Symbol'];
            }
    }
    
    function set_symbol($target_property, $recorded_symbol){
        if($recorded_symbol != 'None'){
            switch($target_property){
                // Sets the chosen specification in the dropdown to a session variable
                case 'property2': record_symbol($recorded_symbol,'prop_2'); break;
                case 'property3': record_symbol($recorded_symbol,'prop_3'); break;
                case 'property4': record_symbol($recorded_symbol,'prop_4'); break;
                case 'property5': record_symbol($recorded_symbol,'prop_5'); break;
                case 'property6': record_symbol($recorded_symbol,'prop_6'); break;
                case 'property7': record_symbol($recorded_symbol,'prop_7'); break;
                case 'property8': record_symbol($recorded_symbol,'prop_8'); break;
                case 'property9': record_symbol($recorded_symbol,'prop_9'); break;
                case 'property10': record_symbol($recorded_symbol,'prop_10'); break;
                default: break;
            }
        }
        else{
            switch($target_property){
                // Deletes the Symbol Session Record if $recorded_symbol is 'None'
                case 'property2': deleteSymbol('prop_2'); break;
                case 'property3': deleteSymbol('prop_3'); break;
                case 'property4': deleteSymbol('prop_4'); break;
                case 'property5': deleteSymbol('prop_5'); break;
                case 'property6': deleteSymbol('prop_6'); break;
                case 'property7': deleteSymbol('prop_7'); break;
                case 'property8': deleteSymbol('prop_8'); break;
                case 'property9': deleteSymbol('prop_9'); break;
                case 'property10': deleteSymbol('prop_10'); break;
                default: break;
            }
        }
    }

    function record_symbol($symbol, $position){
        $_SESSION[$position] = $symbol;
    }
    
    function deleteSymbol($position){
        unset($_SESSION[$position]);
    }

    function get_catalog_numbers($series){
        //Stop
        $sql = "SELECT * FROM contactor_numbers WHERE Series LIKE '%$series%'";
        $cat_nums = array();
        if($query = mysqli_query($GLOBALS['connection'], $sql)){
            while($row = mysqli_fetch_array($query)){
                array_push($cat_nums,array($row['Catalog_No'],$row['Repco_Replacement_Link']));
            }
            return $cat_nums;

        } else{
            echo "ERROR: Not able to execute $sql. " . mysqli_error($GLOBALS['connection']);
        }
    }

    function filter_catalog_numbers(){
        // Group all session variables into an associative array and index them into
        // Note that some positions may be 'Null' so keep that in mind
        $series = $_SESSION['prop_1'];
        $printed_list = array();
        //If exists...
        if(ISSET($series)){
            $all_cat_nums = get_catalog_numbers($series);
            switch($series){
                case 'DS303':
                    // Will utilize 9 properties [prop_1 --> prop_9]
                    // Checks if each exists
                    
                    for($i = 0; $i < sizeof($all_cat_nums); $i++){
                        if(ISSET($_SESSION['prop_2'])){
                            //position [5,1]
                            if(strcmp(substr($all_cat_nums[$i][0],5,1),$_SESSION['prop_2']) != 0){
                                continue; // skip this catalog number (No match)
                            }
                        }
                        if(ISSET($_SESSION['prop_3'])){
                            //position [6,1]
                            if(strcmp(substr($all_cat_nums[$i][0],6,1),$_SESSION['prop_3']) != 0){
                                continue; // skip this catalog number (No match)
                            }
                        }
                        if(ISSET($_SESSION['prop_4'])){
                            //position [7,1]
                            if(strcmp(substr($all_cat_nums[$i][0],7,1),$_SESSION['prop_4']) != 0){
                                continue; // skip this catalog number (No match)
                            }
                        }
                        if(ISSET($_SESSION['prop_5'])){
                            //position [8,2]
                            if(strcmp(substr($all_cat_nums[$i][0],8,2),$_SESSION['prop_5']) != 0){
                                continue; // skip this catalog number (No match)
                            }
                        }
                        if(ISSET($_SESSION['prop_6'])){
                            //position [10,1]
                            if(strcmp(substr($all_cat_nums[$i][0],10,1),$_SESSION['prop_6']) != 0){
                                continue; // skip this catalog number (No match)
                            }
                        }
                        if(ISSET($_SESSION['prop_7'])){
                            //position [11,1]
                            if(strcmp(substr($all_cat_nums[$i][0],11,1),$_SESSION['prop_7']) != 0){
                                continue; // skip this catalog number (No match)
                            }
                        }
                        if(ISSET($_SESSION['prop_8'])){
                            //position [12,4]
                            if(strcmp(substr($all_cat_nums[$i][0],12,4),$_SESSION['prop_8']) != 0){
                                continue; // skip this catalog number (No match)
                            }
                        }
                        if(ISSET($_SESSION['prop_9'])){
                            //position [16,2]
                            if(strcmp(substr($all_cat_nums[$i][0],16,2),$_SESSION['prop_9']) != 0){
                                continue; // skip this catalog number (No match)
                            }
                        }
                        // if no broken conditional statements push to filtered list!
                        array_push($printed_list, strval($all_cat_nums[$i][0]));
                    }
                    break;
                case 'C80':
                    // Will utilize 9 properties [prop_1 --> prop_9]
                    // Checks if each exists

                    for($i = 0; $i < sizeof($all_cat_nums); $i++){
                        if(ISSET($_SESSION['prop_2'])){
                            //position [3,1]
                            if(strcmp(substr($all_cat_nums[$i][0],3,1),$_SESSION['prop_2']) != 0){
                                continue; // skip this catalog number (No match)
                            }
                        }
                        if(ISSET($_SESSION['prop_3'])){
                            //position [4,1]
                            if(strcmp(substr($all_cat_nums[$i][0],4,1),$_SESSION['prop_3']) != 0){
                                continue; // skip this catalog number (No match)
                            }
                        }
                        if(ISSET($_SESSION['prop_4'])){
                            //position [5,1]
                            if(strcmp(substr($all_cat_nums[$i][0],5,1),$_SESSION['prop_4']) != 0){
                                continue; // skip this catalog number (No match)
                            }
                        }
                        if(ISSET($_SESSION['prop_5'])){
                            //position [6,1]
                            if(strcmp(substr($all_cat_nums[$i][0],6,1),$_SESSION['prop_5']) != 0){
                                continue; // skip this catalog number (No match)
                            }
                        }
                        if(ISSET($_SESSION['prop_6'])){
                            //position [7,1]
                            if(strcmp(substr($all_cat_nums[$i][0],7,1),$_SESSION['prop_6']) != 0){
                                continue; // skip this catalog number (No match)
                            }
                        }
                        if(ISSET($_SESSION['prop_7'])){
                            //position [8,1]
                            if(strcmp(substr($all_cat_nums[$i][0],8,1),$_SESSION['prop_7']) != 0){
                                continue; // skip this catalog number (No match)
                            }
                        }
                        if(ISSET($_SESSION['prop_8'])){
                            //position [9,4]
                            if(strcmp(substr($all_cat_nums[$i][0],9,1),$_SESSION['prop_8']) != 0){
                                continue; // skip this catalog number (No match)
                            }
                        }
                        if(ISSET($_SESSION['prop_9'])){
                            //position [10,1]
                            if(strcmp(substr($all_cat_nums[$i][0],10,1),$_SESSION['prop_9']) != 0){
                                continue; // skip this catalog number (No match)
                            }
                        }
                        // if no broken conditional statements push to filtered list!
                        array_push($printed_list, strval($all_cat_nums[$i][0]));
                    }
                    break;
                case 'C82':
                    // Will utilize 10 properties [prop_1 --> prop_10]
                    // Checks if each exists

                    for($i = 0; $i < sizeof($all_cat_nums); $i++){
                        if(ISSET($_SESSION['prop_2'])){
                            //position [3,1]
                            if(strcmp(substr($all_cat_nums[$i][0],3,1),$_SESSION['prop_2']) != 0){
                                continue; // skip this catalog number (No match)
                            }
                        }
                        if(ISSET($_SESSION['prop_3'])){
                            //position [4,1]
                            if(strcmp(substr($all_cat_nums[$i][0],4,1),$_SESSION['prop_3']) != 0){
                                continue; // skip this catalog number (No match)
                            }
                        }
                        if(ISSET($_SESSION['prop_4'])){
                            //position [5,1]
                            if(strcmp(substr($all_cat_nums[$i][0],5,1),$_SESSION['prop_4']) != 0){
                                continue; // skip this catalog number (No match)
                            }
                        }
                        if(ISSET($_SESSION['prop_5'])){
                            //position [6,1]
                            if(strcmp(substr($all_cat_nums[$i][0],6,1),$_SESSION['prop_5']) != 0){
                                continue; // skip this catalog number (No match)
                            }
                        }
                        if(ISSET($_SESSION['prop_6'])){
                            //position [7,1]
                            if(strcmp(substr($all_cat_nums[$i][0],7,1),$_SESSION['prop_6']) != 0){
                                continue; // skip this catalog number (No match)
                            }
                        }
                        if(ISSET($_SESSION['prop_7'])){
                            //position [8,1]
                            if(strcmp(substr($all_cat_nums[$i][0],8,1),$_SESSION['prop_7']) != 0){
                                continue; // skip this catalog number (No match)
                            }
                        }
                        if(ISSET($_SESSION['prop_8'])){
                            //position [9,1]
                            if(strcmp(substr($all_cat_nums[$i][0],9,1),$_SESSION['prop_8']) != 0){
                                continue; // skip this catalog number (No match)
                            }
                        }
                        if(ISSET($_SESSION['prop_9'])){
                            //position [10,1]
                            if(strcmp(substr($all_cat_nums[$i][0],10,1),$_SESSION['prop_9']) != 0){
                                continue; // skip this catalog number (No match)
                            }
                        }
                        if(ISSET($_SESSION['prop_10'])){
                            //position [11,1]
                            if(strcmp(substr($all_cat_nums[$i][0],11,1),$_SESSION['prop_10']) != 0){
                                continue; // skip this catalog number (No match)
                            }
                        }
                        // if no broken conditional statements push to filtered list!
                        array_push($printed_list, strval($all_cat_nums[$i][0]));
                    }
                    break;
                default: break;
            }
        }
        
        return $printed_list;
    }
    
    function print_filtered_list($array_str){
        $array = json_decode($array_str);
        echo '<ul id="matched_nums">';
        for($i = 0; $i < sizeof($array); $i++){
            echo '<li id = "'.$array[$i].'">'.$array[$i]."</li>";
        }
        echo '</ul>';
    }
?>