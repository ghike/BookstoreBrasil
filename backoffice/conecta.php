<?php
//defina seu localhost
$HostName = "sql222.main-hosting.eu";
 
//Define your MySQL Database Name here.
$DatabaseName = "u343885423_bookstore";
 
//Define your Database User Name here.
$HostUser = "u343885423_bsbrazil";
 
//Define your Database Password here.
$HostPass = "TBZZ&KD"; 
 
// Creating MySQL Connection.
$conn = mysqli_connect($HostName,$HostUser,$HostPass,$DatabaseName);
?>