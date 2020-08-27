<?php
require_once "../clases/Conexion.php";
$c = new conectar();
$conexion = $c->conexion();

if(!isset($_POST['buscar'])){

	$_POST['buscar'] = "";
	$buscar = $_POST['buscar'];
}

$buscar = $_POST['buscar'];

$SQL_READ = "SELECT * FROM articulos WHERE nombre LIKE '%".$buscar."%' OR descripcion LIKE'%".$buscar. "%'  ";

$ver2 = mysqli_query($conexion,$SQL_READ);