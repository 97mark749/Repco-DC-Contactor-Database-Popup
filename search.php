<?php
    //header('Content-type: text/plain');
    include('config.php');
    session_start();
    //$_SESSION['validate'] = false;
    //setcookie("validate", "FALSE");



    /// Everything that is going to be displayed in the Results Box
    if(isset($_GET['search'])){
        $search_query = $_GET['search'];
        $search_query = strtoupper(preg_replace("#[^0-9a-z]#i ","",$search_query)); //replace invalid characters & convert to uppercase
        $sql = "SELECT * FROM contactor_numbers WHERE Catalog_No LIKE '%$search_query%'";
        $query = mysqli_query($connection,$sql);
        $count = mysqli_num_rows($query);
        if($count == 0){
            die('Please Enter A Valid Catalog Number!');
        }
        else{
            //setcookie("validate", "TRUE");
            //$_SESSION['validate'] = true;
            $row = mysqli_fetch_array($query);
            $cat_num = $row['Catalog_No'];
            assign_http($search_query);
            if($search_query != $cat_num){
                die('Please Enter A Valid Catalog Number!');
            }
            $series = $row['Series'];
            $db_table = get_table_Name($series);
            $headers = get_table_headers($db_table);
            $content = retrieve_contactor_values($cat_num, $db_table);
            format_content($headers, $content);
        }
    }

    if(isset($_GET['valid'])){format_navigation();}
    if(isset($_GET['website_nav'])){echo $_SESSION['link'];}

    function get_table_name($series_name){
        
        /*$query = $GLOBALS['connection']->prepare('SELECT Table_Name FROM series_tables WHERE Series_Name LIKE CONCAT('%',?,'%')') or die(mysqli_error($GLOBALS['connection']));
        $query->bind_param('s', $series_name);
        $query->execute();
        $query->store_result();
        $table = $query->bind_result();
        if($query->num_rows > 0){
            while($query->fetch()){
                echo $table;
            }
            //echo $table;
            
        }
        */
        $query = mysqli_query($GLOBALS['connection'],"SELECT Table_Name FROM series_tables WHERE Series_Name LIKE '%$series_name%'");
        $count = mysqli_num_rows($query);
        if($count == 0){
            return 'No such result';
        }
        else{
            $row = mysqli_fetch_array($query);
            $table = $row['Table_Name'];
        }
        return $table;
        
    }


    function get_table_headers($table_name){
        $query = mysqli_query($GLOBALS['connection'], "SHOW COLUMNS FROM $table_name");
        $count = mysqli_num_rows($query);
        if($count == 0){
            return 'No such result';
        }
        else{
            while($row = $query->fetch_assoc()){
                // Fetch Column Name and replace invalid characters
                $columns[] = str_replace("_", " ", $row['Field']);
            } 
            return $columns;    // RETURNS THE COLUMN ARRAY
        }
    }


    function retrieve_contactor_values($catalog_num, $table_name){
        $query = $GLOBALS['connection']->prepare("SELECT * FROM $table_name WHERE Catalog_No LIKE CONCAT('%',?,'%')");
        $query->bind_param('s', $catalog_num);

        //Stopped work her for the day
        $query = mysqli_query($GLOBALS['connection'],"SELECT * FROM $table_name WHERE Catalog_No LIKE '%$catalog_num%'");
        $count = mysqli_num_rows($query);
        if($count == 0){
            return 'No such result';
        }
        else{
            $row = mysqli_fetch_array($query);
            return $row;
        }
    }

    function format_content($headers, $values){
        for($i=0; $i<sizeof($headers);$i++){
            echo "<div class='table-row'><div class='table-item-header'>".$headers[$i]."</div><div class='table-item'>".$values[$i]."</div></div>";
        }
    }
    function format_navigation(){
        echo "<p id='click-txt'>Click <a class='btn-results' id = 'website_nav'>Here</a> To View Our Repco Replacement!</p>";
    }

    function assign_http(){
        $temp = $GLOBALS['search_query'];
        $query =  mysqli_query($GLOBALS['connection'], "SELECT Repco_Replacement_Link FROM contactor_numbers WHERE Catalog_No LIKE '%$temp%'");
        $row = mysqli_fetch_array($query);
        $_SESSION['link']= strval($row[0]);
        //setcookie("link",strval($row[0]));
    }
?>