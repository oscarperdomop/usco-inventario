<?php
session_start();
if (isset($_SESSION['usuario'])) {

?>


<?php require_once "dependencias.php" ?>


<head>
	<link rel="stylesheet" href="../css/menu.css">
	<?php require_once "menu.php"; ?>
</head>

<div class="container">
	<h2>Buscando Articulos</h2>
	<div class="row">
		<div class="col-sm-12">
			<div class="table-responsive">


				<table class="table table-responsive table table-hover table-condensed table-bordered" style="text-align: center;">

					<form method="POST" action="buscarArticulos.php">

						<input type="text" name="buscar">
						<input type="submit" value="Buscar">

					</form>
					<br>
					<h3></h3>

					<div class="panel panel-primary ">
						<div class="panel-heading">Productos</div>
						<tr>
							<th>Nombre</th>
							<th>Descripcion</th>
							<th>Cantidad</th>
							<th>Precio</th>
							
							<th>Editar</th>
							<th>Eliminar</th>
						</tr>
					</div>
					<?php require_once "../clases/Conexion.php";

					$c = new conectar();
					$conexion = $c->conexion();
					$sql = "SELECT id_categoria,nombreCategoria from categorias";
					$ver2 = mysqli_query($conexion, $sql);
					?>


					<?php
					include './articulos/read.php';
					while ($ver = mysqli_fetch_array($ver2)) : { ?>
							<tr>
								<td><?= $ver['nombre'] ?></td>
								<td><?= $ver['descripcion'] ?></td>
								<td><?= $ver['cantidad'] ?></td>
								<td><?= $ver['precio'] ?></td>


								
								<td>
									<span data-toggle="modal" data-target="#abremodalUpdateArticulo" class="btn btn-warning btn-xs" onclick="agregaDatosArticulo('<?php echo $ver[0] ?>')">
										<span class="glyphicon glyphicon-pencil"></span>
									</span>
								</td>
								<td>
									<span class="btn btn-danger btn-xs" onclick="eliminaArticulo('<?php echo $ver[0] ?>')">
										<span class="glyphicon glyphicon-remove"></span>
									</span>
								</td>



						<?php }
					endwhile; ?>
				</table>
			</div>
		</div>
	</div>
</div>

<body>
	<!-- Modal -->
	<div class="modal fade" id="abremodalUpdateArticulo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel">Actualiza Articulo</h4>
				</div>

				<div class="modal-body">
					<form id="frmArticulosU" enctype="multipart/form-data">
						<input type="text" id="idArticulo" hidden="" name="idArticulo">
						<label>Categoria</label>
						<select class="form-control input-sm" id="categoriaSelectU" name="categoriaSelectU">
							<option value="A">Selecciona Categoria</option>
							<?php
							$sql = "SELECT id_categoria,nombreCategoria
								from categorias";
							$ver2 = mysqli_query($conexion, $sql);
							?>
							<?php while ($ver = mysqli_fetch_row($ver2)) : ?>
								<option value="<?php echo $ver[0] ?>"><?php echo $ver[1]; ?></option>
							<?php endwhile; ?>
						</select>
						<label>Nombre</label>
						<input type="text" class="form-control input-sm" id="nombreU" name="nombreU">
						<label>Descripcion</label>
						<input type="text" class="form-control input-sm" id="descripcionU" name="descripcionU">
						<label>Cantidad</label>
						<input type="text" class="form-control input-sm" id="cantidadU" name="cantidadU">
						<label>Precio</label>
						<input type="text" class="form-control input-sm" id="precioU" name="precioU">

					</form>
				</div>
				<div class="modal-footer">
					<button id="btnActualizaarticulo" type="button" class="btn btn-warning" data-dismiss="modal">Actualizar</button>

				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	function agregaDatosArticulo(idarticulo) {
		$.ajax({
			type: "POST",
			data: "idart=" + idarticulo,
			url: "../procesos/articulos/obtenDatosArticulo.php",
			success: function(r) {

				dato = jQuery.parseJSON(r);
				$('#idArticulo').val(dato['id_producto']);
				$('#categoriaSelectU').val(dato['id_categoria']);
				$('#nombreU').val(dato['nombre']);
				$('#descripcionU').val(dato['descripcion']);
				$('#cantidadU').val(dato['cantidad']);
				$('#precioU').val(dato['precio']);

			}
		});
	}

	function eliminaArticulo(idArticulo) {
		alertify.confirm('¿Desea eliminar este articulo?', function() {
			$.ajax({
				type: "POST",
				data: "idarticulo=" + idArticulo,
				url: "../procesos/articulos/eliminarArticulo.php",
				success: function(r) {
					if (r == 1) {
						$('#tablaArticulosLoad').load("articulos/tablaArticulos.php");
						alertify.success("Eliminado con exito!!");
					} else {
						alertify.error("No se pudo eliminar :(");
					}
				}
			});
		}, function() {
			alertify.error('Cancelo !')
		});
	}
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#btnActualizaarticulo').click(function() {

			datos = $('#frmArticulosU').serialize();
			$.ajax({
				type: "POST",
				data: datos,
				url: "../procesos/articulos/actualizaArticulos.php",
				success: function(r) {
					if (r == 1) {
						$('#tablaArticulosLoad').load("articulos/tablaArticulos.php");
						alertify.success("Actualizado con exito :D");
					} else {
						alertify.error("Error al actualizar :(");
					}
				}
			});
		});
	});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#tablaArticulosLoad').load("articulos/tablaArticulos.php");

		$('#btnAgregaArticulo').click(function() {

			vacios = validarFormVacio('frmArticulos');

			if (vacios > 0) {
				alertify.alert("Debes llenar todos los campos!!");
				return false;
			}

			var formData = new FormData(document.getElementById("frmArticulos"));

			$.ajax({
				url: "../procesos/articulos/insertaArticulos.php",
				type: "post",
				dataType: "html",
				data: formData,
				cache: false,
				contentType: false,
				processData: false,

				success: function(r) {

					if (r == 1) {
						$('#frmArticulos')[0].reset();
						$('#tablaArticulosLoad').load("articulos/tablaArticulos.php");
						alertify.success("Agregado con exito :D");
					} else {
						alertify.error("Fallo al subir el archivo :(");
					}
				}
			});

		});
	});
</script>

<?php
} else {
	header("location:../index.php");
}
?>