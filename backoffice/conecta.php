<?php
//defina seu localhost
$HostName = "SeuLocalHost";
 
//Define your MySQL Database Name here.
$DatabaseName = "u343885423_bookstore";
 
//Define your Database User Name here.
$HostUser = "SeuUser";
 
//Define your Database Password here.
$HostPass = "SuaSenha";
 
// Creating MySQL Connection.
$conn = mysqli_connect($HostName,$HostUser,$HostPass,$DatabaseName);
?>