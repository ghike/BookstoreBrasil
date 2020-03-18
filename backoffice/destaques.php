<?php
 
include 'jsonConn.php';
header("Access-Control-Allow-Origin: *");

$json = file_get_contents('php://input');
 
$obj = json_decode($json,true);

$SQL="SELECT * FROM livros WHERE DESTAQUE = 1"; 
$resultado = mysqli_query($conn,$SQL);
    while ($dados=mysqli_fetch_array($resultado))
    {
        $precocomma = preg_replace('/,/', '.', $dados['PRECO']);
        $item=array(
            "id"=>$dados['ID'],
            "titulo" => $dados['TITULO'],
            "autor" => $dados['AUTOR'],
            "preco" => $precocomma,
            "estoque" => $dados['ESTOQUE'],
            "imagem" => $dados['IMAGEM'],
            "destaque" => $dados['DESTAQUE'],
        );

         $r[]= $item;
    }    

    echo json_encode($r);

 mysqli_close($conn);
?>