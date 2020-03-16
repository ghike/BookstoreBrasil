<?php
require("conecta.php");
$login=0;

if (isset($_POST['usuario']))
{
	$usuario=$_POST['usuario'];
	$senha  =$_POST['senha'];

	$login=0;

	$sql="SELECT * FROM administradores WHERE EMAIL='".$usuario."' AND SENHA='".$senha."'";
	$resultado=mysqli_query($conn, $sql);
	if ($resultado!=NULL)
	{
		while ($dados=mysqli_fetch_array($resultado))
		{
			if ($usuario==$dados['EMAIL'])
			{
				echo "chegou no email";
				if ($senha==$dados['SENHA'])
				{
					echo "chegou na senha";
					$login=1;	
				}
			}

		}
	}  

	if ($login==1)
	{
		setcookie('8a84b10616b4f88b9b3a17c077d59bb5','ok',time()+3600);
		setcookie('d9549186992671f74bb85b480e8e319b','1', time()+3600);
		header ('Location:adm/cadastra_livro.php');

	}
	else
	{
		setcookie('8a84b10616b4f88b9b3a17c077d59bb5','',time()-1);
		setcookie('d9549186992671f74bb85b480e8e319b','0', time()-1);
		header ('Location:acesso.php');
	}
}
?>