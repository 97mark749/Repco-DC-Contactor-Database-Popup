<?php
    include('config.php');
    // will take the users inputted text and print out all catalog numbers that contain the typed in text.

    if(!empty($_POST['keyword'])){
        $query = $connection->prepare("SELECT Catalog_No FROM contactor_numbers WHERE Catalog_No Like CONCAT(?,'%')");
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
                echo '<li onclick="selectNumber('.strval(($cat_num)).')" id="'.$ncat_num.'">'.$txt.'</li>';
            }
            echo '</ul>';
            exit;
        }
    }
    else{
        return '';
    }
    /*
<?php
    include('config.php');


    if(!empty($_POST['keyword'])){
        $query = mysqli_query($connection,"SELECT Catalog_No FROM contactor_numbers WHERE Catalog_No LIKE '".$_POST['keyword']."%' ORDER BY Catalog_No"); //WHERE Catalog_No LIKE '%$number%' LIMIT 18");
        if(mysqli_num_rows($query) > 0){
            //$suffix = substr($num['Catalog_No'],sizeof($_POST['keyword']) - 1);
            echo '<ul id="suggestions-list">';
            while($num = mysqli_fetch_assoc($query)){
                $txt = strtoupper('<strong>'.$_POST['keyword'].'</strong>'.substr($num['Catalog_No'],strlen($_POST['keyword'])));
                echo '<li onclick="selectNumber('.strval(($num['Catalog_No'])).')" id="'.$num['Catalog_No'].'">'.$txt.'</li>';
            }
            echo '</ul>';
            exit;
        }
    }
    else{
        return '';
    }
?>
    */
?>

