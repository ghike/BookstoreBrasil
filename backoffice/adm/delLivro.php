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

if(isset($_POST['g-recaptcha-response'])){
	$titulo = $_POST["titulo"];
	$captcha_data = $_POST['g-recaptcha-response'];

	if ($captcha_data == ''){
		echo "Errou!";
	}
	else{
		$resposta = curl_init("https://www.google.com/recaptcha/api/siteverify?secret=6Le8guEUAAAAAKEi401K2vmjh7WZS598sOIzmrI4&response=".$captcha_data."&remoteip=".$_SERVER['REMOTE_ADDR']);
		curl_setopt($resposta, CURLOPT_RETURNTRANSFER, true);
		$verifica = curl_exec($resposta);
		if ($verifica.'success') {

			echo $nome;
			echo $captcha_data;
			$sql = "DELETE FROM livros WHERE TITULO = '$titulo'";

			mysqli_query($conn, $sql);
			header("location: exclui_livro.php");
		}
	}	
}

?>