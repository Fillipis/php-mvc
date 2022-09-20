<?php

    // se for em ambiente de produção, não é ideal exibir erros.
    error_reporting(0);

    $db_host = 'localhost';
    $db_user = 'roote';
    $db_pass = '';
    $db_name = 'php_mvc';

    $mysqli = new mysqli($db_host, $db_user, $db_pass, $db_name);

    if ($mysqli -> connect_errno) {
        // echo "Falha so se conectar a base de dados : " . $mysqli -> connect_error;
        echo "Falha ao se conectar a base de dados.";
        exit();
    }else{
        echo "Base de dados conectada.";
    }
?>