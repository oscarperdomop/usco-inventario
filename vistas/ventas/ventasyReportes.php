<?php

require_once "../../clases/Conexion.php";
require_once "../../clases/Ventas.php";

$c = new conectar();
$conexion = $c->conexion();

$obj = new ventas();

$sql = "SELECT id_venta,
				fechaCompra,
				id_cliente 
			from ventas group by id_venta";
$result = mysqli_query($conexion, $sql);
?>

<h4></h4>
<div class="row">
	<div class="col-sm-1"></div>
	<div class="col-sm-10">
		<div class="table-responsive">
			<div class="panel panel-default ">
				<table class="table table-hover table-condensed table-bordered" style="text-align: center;">
				<div class="panel-heading">Reportes y ventas</div>
					<tr>
						<th>Folio</th>
						<th>Fecha</th>
						<th>Cliente</th>
						<th>Total de compra</th>
						<th>Ticket</th>
						<th>Reporte</th>
					</tr>
					<?php while ($ver = mysqli_fetch_row($result)) : ?>
						<tr>
							<td><?php echo $ver[0] ?></td>
							<td><?php echo $ver[1] ?></td>
							<td>
								<?php
								if ($obj->nombreCliente($ver[2]) == " ") {
									echo "S/C";
								} else {
									echo $obj->nombreCliente($ver[2]);
								}
								?>
							</td>
							<td>
								<?php
								echo "$" . $obj->obtenerTotal($ver[0]);
								?>
							</td>
							<td>
								<a href="../procesos/ventas/crearTicketPdf.php?idventa=<?php echo $ver[0] ?>" class="btn btn-danger btn-sm">
									Ticket <span class="glyphicon glyphicon-list-alt"></span>
								</a>
							</td>
							<td>
								<a href="../procesos/ventas/crearReportePdf.php?idventa=<?php echo $ver[0] ?>" class="btn btn-danger btn-sm">
									Reporte <span class="glyphicon glyphicon-file"></span>
								</a>
							</td>
						</tr>
					<?php endwhile; ?>
				</table>
			</div>
			</div>
		</div>
		<div class="col-sm-1"></div>
	</div>