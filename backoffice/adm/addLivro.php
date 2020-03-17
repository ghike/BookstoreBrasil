<?php

$permitido=0;
if (isset($_COOKIE['8a84b10616b4f88b9b3a17c077d59bb5']))
{
  $login=$_COOKIE['8a84b10616b4f88b9b3a17c077d59bb5'];
  if($login=='ok')
  {
     $permitido=1;
  }
  else
  {
    $permitido=0;
  }
}
else
{
  $permitido=0;
}
if ($permitido==0)
{
header ('location:../acesso.php');
}

require("conecta.php");

if(isset($_POST['titulo'])){
	$titulo = $_POST["titulo"];
	$autor = $_POST["autor"];
	$preco = $_POST["preco"];
	$estoque = $_POST["estoque"];
	$destaque = $_POST["destaque"];

	if($_FILES['arquivo']["tmp_name"] == "")
	{			
		echo "Arquivo vazio!";
		exit();
	}
	else
	{
		
		$arquivo = $_FILES['arquivo']['name'];
		$arquivo = strtolower($arquivo); //deixa tudo em letras minúsculas
		
		
		//VERIFICAR O TIPO (A EXTENSÃO) DO ARQUIVO DE IMAGEM
		$tipos = array('image/jpeg','image/pjpeg','image/jpg','image/gif','image/png');
		$arqType = $_FILES['arquivo']['type'];
		if(array_search($arqType,$tipos) === false){
			
			//echo "Formato de arquivo inválido";
			
			exit;
		}
		//VERIFICAR PELO NOME SE O ARQUIVO DE IMAGEM EXISTE NA PASTA DE UPLOAD
		else{
			// onde uploads é o nome da subpasta onde os arquivos serão gravados
			if(file_exists("../images/$arquivo")){
				$a = 1;
				while(file_exists("../images/[$a]$arquivo")){
					$a++;
				}
				$arquivo = "[".$a."]".$arquivo;
			}
			//ERRO NO UPLOAD DO ARQUIVO DE IMAGEM
			if(!move_uploaded_file($_FILES['arquivo']['tmp_name'], "../images/".$arquivo)){
				echo "erro no upload";	
				exit;
			}
		//	echo "Arquivo ".$arquivo. " gravado na pasta uploads";
			
	//		echo "<img src=\"uploads/".$arquivo."\" width=\"200\">";
		}
	}

	$sql = "INSERT INTO livros (TITULO, AUTOR, PRECO, ESTOQUE, IMAGEM, DESTAQUE) VALUES ('$titulo', '$autor', '$preco', '$estoque', '$arquivo', '$destaque') ";
	mysqli_query($conn, $sql);
	header("location: cadastra_livro.php");
}

?>