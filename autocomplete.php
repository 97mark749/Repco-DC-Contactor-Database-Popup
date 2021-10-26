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