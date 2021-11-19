<?php
    include('config.php');
    // will take the users inputted text and print out all catalog numbers that contain the typed in text.
    if(!empty($_POST['keyword'])){
        $query = $connection->prepare("SELECT Catalog_No FROM contactor_numbers WHERE Catalog_No Like CONCAT(?,'%')") or die(mysqli_error($connection));
        // Binds the parameter as a string given the inserted input within the popup.
        $val = preg_replace("#[^0-9a-z]#i ","",$_POST['keyword']);
        $query->bind_param('s',$val);
        $query->execute();
        $query->store_result();
        $query->bind_result($cat_num);

        if($query->num_rows > 0){
            echo '<ul id="suggestions-list">';
            while($query->fetch()){
                // $txt = 'TYPED_IN_TEXT + rest_of_cat_number'
                $txt = strtoupper('<strong>'.$val.'</strong>'.substr($cat_num,strlen($val)));
                echo '<li onclick="selectNumber('.strval(($cat_num)).')" id="'.$cat_num.'">'.$txt.'</li>';
            }
            echo '</ul>';
            $query->close();
            exit;
        }
    }
    else{
        die;
    }
?>

