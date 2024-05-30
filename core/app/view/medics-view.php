<div class="row">
	<div class="col-md-12">
		<div class="card">
			<div class="card-header" data-background-color="blue">
				<h4 class="title">Personal Médico</h4>
			</div>
			<div class="card-content table-responsive">
				<div class="btn-group">
					<a href="index.php?view=newmedic" class="btn btn-default"><i class='fa fa-support'></i> Nuevo Dentista</a>
				</div>

				<?php
				$users = MedicData::getAll();
				if(count($users) > 0){
					// si hay usuarios
					?>
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>Nombre completo</th>
								<th>Dirección</th>
								<th>Email</th>
								<th>Teléfono</th>
								<th>Área</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<?php
							foreach($users as $user){
								?>
								<tr>
									<td><?php echo $user->name." ".$user->lastname; ?></td>
									<td><?php echo $user->address; ?></td>
									<td><?php echo $user->email; ?></td>
									<td><?php echo $user->phone; ?></td>
									<td><?php if($user->category_id != null){ echo $user->getCategory()->name; } ?></td>
									<td style="width:280px;">
										<a href="index.php?view=medichistory&id=<?php echo $user->id;?>" class="btn btn-default btn-xs">Historial</a>
										<a href="index.php?view=editmedic&id=<?php echo $user->id;?>" class="btn btn-warning btn-xs">Editar</a>
										<a href="index.php?view=delmedic&id=<?php echo $user->id;?>" class="btn btn-danger btn-xs">Eliminar</a>
									</td>
								</tr>
								<?php
							}
							?>
						</tbody>
					</table>
					<?php
				} else {
					echo "<p class='alert alert-danger'>No hay medicos</p>";
				}
				?>
			</div>
		</div>
	</div>
</div>
