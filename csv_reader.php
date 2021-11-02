<?php
    include("config.php");
    insert_oem("csv/GE_Contactors.csv", "General Electric");

    function insert_oem($file, $manufacturer){
        //Parsing a CSV sheet
        $parsed_oems = array();
        $parsed_links = array();
        $spreadsheet = fopen(strval($file), 'r');
        while(($rows = fgetcsv($spreadsheet, 0, ',')) !== FALSE){
            array_push($parsed_oems, $rows[0]);
            array_push($parsed_links, $rows[1]);
        }
        switch($manufacturer){
            case 'General Electric':
                for($i=1; $i < sizeof($parsed_oems);$i++){
                    if (substr($parsed_oems[$i],0,5) == 'DS303'){
                        $array = array();
                        $db = mysqli_connect(server,username,password,'DS303');
                        $a = get_value($db,substr($parsed_oems[$i],5,1),1);array_push($array,substr($parsed_oems[$i],5,1));
                        $b = get_value($db,substr($parsed_oems[$i],6,1),2);array_push($array,substr($parsed_oems[$i],6,1));
                        $c = get_value($db,substr($parsed_oems[$i],7,1),3);array_push($array,substr($parsed_oems[$i],7,1));
                        $d = get_value($db,substr($parsed_oems[$i],8,2),4);array_push($array,substr($parsed_oems[$i],8,2));
                        $e = get_value($db,substr($parsed_oems[$i],10,1),5);array_push($array,substr($parsed_oems[$i],10,1));
                        $f = get_value($db,substr($parsed_oems[$i],11,1),6);array_push($array,substr($parsed_oems[$i],11,1));
                        $g = get_value($db,substr($parsed_oems[$i],12,4),7);array_push($array,substr($parsed_oems[$i],12,4));
                        $h = get_value($db,substr($parsed_oems[$i],16,2),8);array_push($array,substr($parsed_oems[$i],16,2));
                        mysqli_close($db);
                        //$cat_num = 'DS303'.$array[0].$array[1].$array[2].$array[3].$array[4].$array[5].$array[6].$array[7];
                        $connection = mysqli_connect(server,username,password,db);
                        insert_row_main_db($connection,$parsed_oems[$i], $manufacturer,'DS303',$parsed_links[$i]);
                        echo'<br>';
                        insert_row_series_db($connection,'DS303',$parsed_oems[$i],[$a,$b,$c,$d,$e,$f,$g,$h]);
                        echo'<br>';
                        mysqli_close($connection);
                    }
                }
                break;
            case 'Cutler Hammer':
                break;
            case 'Clark':
                break;
            case 'BCH':
                break;
            default:
                break;
        }      
        
    }
    function get_value($db, $symbol, $position){
        if($position == 1){
            $query = mysqli_query($db, "SELECT Value FROM Voltage WHERE Symbol LIKE '%$symbol%'");
            if(mysqli_num_rows($query) != 0){$array = mysqli_fetch_array($query);return $array['Value'];}else{return FALSE;}
        }
        else if($position == 2){
            $query = mysqli_query($db, "SELECT Value FROM NEMA_Size WHERE Symbol LIKE '%$symbol%'");
            if(mysqli_num_rows($query) != 0){$array = mysqli_fetch_array($query);return $array['Value'];}else{return FALSE;}
        }
        else if($position == 3){
            $query = mysqli_query($db, "SELECT Value FROM Contact_Pole_Configuration WHERE Symbol LIKE '%$symbol%'");
            if(mysqli_num_rows($query) != 0){$array = mysqli_fetch_array($query);return $array['Value'];}else{return FALSE;}
        }
        else if($position == 4){
            $query = mysqli_query($db, "SELECT Value FROM Electromechanical_Configuration WHERE Symbol LIKE '%$symbol%'");
            if(mysqli_num_rows($query) != 0){$array = mysqli_fetch_array($query);return $array['Value'];}else{return FALSE;}
        }
        else if($position == 5){
            $query = mysqli_query($db, "SELECT Value FROM Blowout_Coil_Rating WHERE Symbol LIKE '%$symbol%'");
            if(mysqli_num_rows($query) != 0){$array = mysqli_fetch_array($query);return $array['Value'];}else{return FALSE;}
        }
        else if($position == 6){
            $query = mysqli_query($db, "SELECT Value FROM NC_Blowout_Coil_Rating WHERE Symbol LIKE '%$symbol%'");
            if(mysqli_num_rows($query) != 0){$array = mysqli_fetch_array($query);return $array['Value'];}else{return FALSE;}
        }
        else if($position == 7){
            $query = mysqli_query($db, "SELECT Value FROM Coil_Voltage WHERE Symbol LIKE '%$symbol%'");
            if(mysqli_num_rows($query) != 0){$array = mysqli_fetch_array($query);return $array['Value'];}else{return FALSE;}
        }
        else if($position == 8){
            $query = mysqli_query($db, "SELECT Value FROM Auxiliaries WHERE Symbol LIKE '%$symbol%'");
            if(mysqli_num_rows($query) != 0){$array = mysqli_fetch_array($query);return $array['Value'];}else{return FALSE;}
        }
        else{return FALSE;}

    }

    function insert_row_series_db($connection,$series, $cat_num, $values){
        if($series == "DS303"){
            $sql = "INSERT INTO ds303_contactors (Catalog_No,Series,Voltage,NEMA_Size,Contact_Pole_Configuration,Electromechanical_Configuration,Blowout_Coil_Rating,NC_Blowout_Coil_Rating,Coil_Voltage,Auxiliaries) VALUES ('$cat_num', 'DS303','$values[0]','$values[1]','$values[2]','$values[3]','$values[4]','$values[5]','$values[6]','$values[7]')";
           if(mysqli_query($connection, $sql)){
            echo "Records inserted successfully.";
            } else{
                echo "ERROR: Could not able to execute $sql. " . mysqli_error($connection);
            }
        }
        else{return FALSE;}
    }

    function insert_row_main_db($connection, $cat_num,$manufacturer,$series,$link){
        $sql = "INSERT INTO contactor_numbers (Catalog_No,Manufacturer,Series,Repco_Replacement_Link) VALUES ('$cat_num','$manufacturer','$series','$link')";
        if(mysqli_query($connection, $sql)){
            echo "Records inserted successfully.";
        } else{
            echo "ERROR: Not able to execute $sql. " . mysqli_error($connection);
        }
    }
?>