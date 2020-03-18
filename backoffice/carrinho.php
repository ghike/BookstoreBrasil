<?php
include 'jsonConn.php';
header("Access-Control-Allow-Origin: *");
$json = file_get_contents('php://input');
$obj = json_decode($json,true);
$titulo = $obj['titulo'];
$quantidade = $obj['quantidade'];
$intQtd = $quantidade;
$estoque= "SELECT * FROM livros WHERE TITULO='$titulo'";
$resultado = mysqli_query($conn,$estoque);
$row = mysqli_fetch_array($resultado);
$intEstoque = $row['ESTOQUE'];
$estoqueReal = $intEstoque - $intQtd;
$Sql_Query = "UPDATE livros SET ESTOQUE=$estoqueReal WHERE TITULO = '$titulo'";
if(mysqli_query($conn,$Sql_Query)){
	$MSG = 'O item foi comprado!';
	$json = json_encode($MSG);
	echo $json;
}
else{
	$MSG = 'Ops! Tente novamente.';
	$json = json_encode($MSG);
	echo $json;
}
mysqli_close($conn);
?>