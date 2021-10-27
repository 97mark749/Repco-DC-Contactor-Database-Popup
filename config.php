<?php
    define('username','kirbym3');
    define('password','mkRepco6!');
    define('server','localhost');
    define('db','dc_contactors');

    try{
        // Connect to MySQLi Database
        $connection = mysqli_connect(server,username,password,db);


        //encoded language
        mysqli_set_charset($connection, 'utf8');
        // Check Connection
    }catch(Exception $ex){
        print "An Exception Occured. Message:".$ex->getMessage();
    }catch(Error $e){
        print "The system is busy please try later: ".$e->getMessage();
    }
    
    function close_connection(){
        mysqli_close(mysqli_connect(server,username,password,db));
    }
?>