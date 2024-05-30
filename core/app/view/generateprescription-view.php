<?php
// Habilitar la visualización de errores
ini_set('display_errors', 1);
error_reporting(E_ALL);

include_once $_SERVER['DOCUMENT_ROOT'] . "/Clinica-Dental/core/autoload.php";
include_once $_SERVER['DOCUMENT_ROOT'] . "/Clinica-Dental/core/controller/Executor.php";
include_once $_SERVER['DOCUMENT_ROOT'] . "/Clinica-Dental/core/app/model/PacientData.php";
include_once $_SERVER['DOCUMENT_ROOT'] . "/Clinica-Dental/core/app/model/MedicData.php";

$pacients = PacientData::getAll();
$medics = MedicData::getAll();
?>

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>Generar Receta Médica</title>
  <link href="../../../assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="../../../assets/css/material-dashboard.css" rel="stylesheet"/>
  <style>
    .container {
      background-color: rgba(255, 255, 255, 0.9);
      padding: 20px;
      border-radius: 10px;
      margin-top: 50px;
    }
    .btn-primary {
      margin-right: 10px;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header" data-background-color="blue">
            <h4 class="title">Generar Receta Médica</h4>
          </div>
          <div class="card-content table-responsive">
            <form action="/Clinica-Dental/report/generate_pdf.php" method="post">
              <div class="form-group">
                <label for="pacient_id">Nombre del Paciente:</label>
                <select class="form-control" id="pacient_id" name="pacient_id" required>
                  <option value="">-- SELECCIONE --</option>
                  <?php foreach($pacients as $p): ?>
                    <option value="<?php echo $p->id; ?>"><?php echo $p->name . " " . $p->lastname; ?></option>
                  <?php endforeach; ?>
                </select>
              </div>
              <div class="form-group">
                <label for="medic_id">Dentista:</label>
                <select class="form-control" id="medic_id" name="medic_id" required>
                  <option value="">-- SELECCIONE --</option>
                  <?php foreach($medics as $m): ?>
                    <option value="<?php echo $m->id; ?>"><?php echo $m->name . " " . $m->lastname; ?></option>
                  <?php endforeach; ?>
                </select>
              </div>
              <div class="form-group">
                <label for="prescriptionDetails">Detalles de la Receta:</label>
                <textarea class="form-control" id="prescriptionDetails" name="prescriptionDetails" rows="10" required></textarea>
              </div>
              <button type="submit" class="btn btn-primary">Generar Receta</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
