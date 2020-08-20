<?php
session_start();
if (isset($_SESSION['usuario'])) {

?>


	<!DOCTYPE html>
	<html>

	<head>
		<title>inicio</title>
		<?php require_once "menu.php"; ?>
		<link rel="stylesheet" href="../css/menu.css" />
	</head>

	<body>
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<div class="panel panel-default ">
						<div class="panel-heading"><a href="articulos.php">ARTICULOS</a></div>
						<div  class="panel"><a href="articulos.php"><img src="../img/productos.jpg" class="img-responsive" style="width:100%"style="height:250px" alt="">		
						</a></div>
						<div class="panel-footer">Agrega articulos a tu inventario</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="panel panel-default ">
					<div class="panel-heading"><a href="categorias.php">CATEGORIAS</a></div>
						<div class="panel"><a href="categorias.php"><img src="../img/categorias.jpg" class="img-responsive" style="width:100%" alt="">		
						</a></div>
						<div class="panel-footer">Agrega y gestiona las categorias</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="panel panel-default ">
					<div class="panel-heading"><a href="ventas.php">VENTAS</a></div>
						<div class="panel"><a href="ventas.php"><img src="../img/venta.jpg" class="img-responsive" style="width:100%" alt="">		
						</a></div>
						<div class="panel-footer">Vende o gestiona tus ventas</div>
					</div>
				</div>
			</div>
		</div><br><br>

	</body>

	</html>
<?php
} else {
	header("location:../index.php");
}
?>