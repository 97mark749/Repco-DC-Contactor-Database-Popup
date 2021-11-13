<?php
    include('config.php');


    if(!empty($_POST['keyword'])){
        $query = $connection ->prepare("SELECT Catalog_No FROM contactor_numbers WHERE Catalog_No Like ?");
        // Binds the parameter as a string given the inserted input within the popup.
        $query->bind_param('s',$_POST['keyword']);
        $query->execute();
        $query->store_result();
        $query->close();

        if($query->num_rows > 0){
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