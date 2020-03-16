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

require ('conecta.php');
?>


<?php
$titulo = '';
$autor = '';
$preco = '';
$estoque = '';
$imagem = '';
$destaque = '';

$abrir=0;
if (isset($_POST['abrir']))
{
  $abrir=1;
}
if (isset($_POST['titulo']))
{

  $titulo=$_POST['titulo'];
  $sql="SELECT * FROM livros where TITULO='".$titulo."'";
  $resultado=mysqli_query($conn, $sql);

  while ($dados=mysqli_fetch_array($resultado))
  {
    $titulo=$dados['TITULO'];
    $autor=$dados['AUTOR'];
    $preco=$dados['PRECO'];
    $estoque=$dados['ESTOQUE'];
    $imagem=$dados['IMAGEM'];
    $destaque=$dados['DESTAQUE'];
  }

}


?>

<!DOCTYPE html>
<html lang="pt-br">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Editar Livro • Book Store Brasil</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.css" rel="stylesheet">
</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar" style="padding-top: 10px;">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.php">
        <div class="sidebar-brand-icon" style="padding-bottom: 10px;">
          <img src="img/logo.png">
        </div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        LIVROS
      </div>

      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="cadastra_livro.php">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Cadastrar Livro</span></a>
        </li>

        <!-- Nav Item - Tables -->
        <li class="nav-item active">
          <a class="nav-link" href="edita_livro.php">
            <i class="fas fa-fw fa-table"></i>
            <span>Editar Livro</span></a>
          </li>

          <!-- Nav Item - Tables -->
          <li class="nav-item">
            <a class="nav-link" href="exclui_livro.php">
              <i class="fas fa-fw fa-trash"></i>
              <span>Remover Livro</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->

          </ul>

          <!-- Content Wrapper -->
          <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

              <?php
              require("utils/topbar.php");
              ?>

              <!-- Begin Page Content -->
              <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h3 mb-4 text-gray-800">Editar Livro</h1>

                <div class="card shadow mb-4">
                  <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Selecione um Título</h6>
                  </div>
                  <div class="card-body">
                    <form method="POST" action="edita_livro.php">
                      <select id="titulo" name="titulo" class="form-control">
                        <?php
                        $sql="SELECT * FROM livros order by TITULO";
                        $resultado=mysqli_query($conn, $sql);

                        while ($dados=mysqli_fetch_array($resultado))
                        {
                          echo "<option>".$dados['TITULO']."</option>";
                        }
                        ?>


                      </select>
                      <input type="hidden" value="1" name="abrir">
                      <input type="submit" value="Buscar" name="Buscar">
                    </form>
                  </div>
                </div>
                <?php if ($abrir==1) { ?>
                  <div class="card shadow mb-4" id="formula">
                    <div class="card-header py-3">
                      <h6 class="m-0 font-weight-bold text-primary">Formulário de Edição</h6>
                    </div>

                    <div class="card-body">
                      <p class="d-md-block" style="color: #4e73df;">Todos os campos com * são obrigatórios.</p>
                      <form action="altLivro.php" method="POST" enctype="multipart/form-data" id="cadastro">

                        <div class="row">
                          <div class="col-md-6">
                            <label>Título do Livro*</label>
                            <input id="titulo" <?php if($titulo!='') { echo "value=\"$titulo\""; } ?> readonly placeholder="Informe o Título do Livro..." name="titulo" class="form-control" required/>
                          </div>
                          <div class="col-md-6">
                            <label>Autor(es)*</label>
                            <input id="autor" <?php if($autor!='') { echo "value=\"$autor\""; } ?> name="autor" placeholder="Informe o(s) Autor(es) do Livro..." class="form-control" required/>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-md-3">
                            <label>Preço*</label>
                            <input id="preco" <?php if($preco!='') { echo "value=\"$preco\""; } ?> name="preco" step="0.01" placeholder="Informe o preço..." type="number" maxlength="15" class="form-control"/>
                          </div>
                          <div class="col-md-3">
                            <label>Qtde. em Estoque</label>
                            <input id="estoque" <?php if($estoque!='') { echo "value=\"$estoque\""; } ?> name="estoque" type="number" placeholder="Informe a quantidade em estoque..." maxlength="5" class="form-control"/>
                          </div>
                          <div class="col-md-6">
                            <label>Destacar no Carrossel?</label>
                            <select name="destaque" id="destaque" class="form-control">
                              <?php if ($destaque == 0){
                               echo "<option value='0'>Não</option>";
                               ?>
                               <option value="1">Sim</option>
                             <?php } else {
                               echo "<option value='1'>Sim</option>";
                               ?>
                               <option value="0">Não</option>
                             <?php } ?>
                           </select>
                         </div>
                       </div>
                       <div class="row">
                        <div class="col-md-12">
                          <label>Capa do Livro*</label>
                          <div class="col-md-6 col-sm-12 col-xs-12">
                            <div class="card shadow mb-4">
                              <?php
                              if($imagem!='')
                                echo "<img src='../images/".$imagem."' width='100%' draggable='false' onmousedown='return false'>";
                              ?>
                            </div>
                          </div>
                          <input id="arquivo" name="arquivo" type="file" class="form-control"/>
                          <p class="d-md-block" style="margin-top: 10px;">Utilize uma imagem em proporção 9:16 ou próxima disto.</p>
                        </div>
                      </div>
                      <input type="submit" class="btn waves-effect waves-light grey darken-2" type="submit" name="action" style="width: 90% !important; color: red;">
                    </form>

                  </div>
                </div>
                <!-- /.container-fluid -->
              <?php } // if do abrir ?>
            </div>
            <!-- End of Main Content -->

          </div>
          <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
          <i class="fas fa-angle-up"></i>
        </a>

        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>

      </body>

      </html>
