<?php
// Habilitar la visualización de errores
ini_set('display_errors', 1);
error_reporting(E_ALL);

require_once $_SERVER['DOCUMENT_ROOT'] . '/core/autoload.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/core/controller/Executor.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/core/app/model/PacientData.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/core/app/model/MedicData.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/vendor/autoload.php';

use Dompdf\Dompdf;
use Dompdf\Options;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $pacientId = $_POST['pacient_id'];
    $medicId = $_POST['medic_id'];
    $prescriptionDetails = nl2br(htmlspecialchars($_POST['prescriptionDetails']));

    // Obtener los datos del paciente
    $pacient = PacientData::getById($pacientId);
    $patientName = $pacient->name . ' ' . $pacient->lastname;

    // Obtener los datos del médico
    $medic = MedicData::getById($medicId);
    $medicName = $medic->name . ' ' . $medic->lastname;

    // Datos de la clínica
    $clinic_name = "Clínica Dental Gil&Torres";
    $clinic_address_1 = "Barrio Nueva Democracia, cuarta calle 034 Zona 2";
    $clinic_address_2 = "Asunción Mita, Jutiapa";
    $clinic_phone = "Tel: 78460525";
    $logo_path = $_SERVER['DOCUMENT_ROOT'] . "/imagenes/logo.jpg"; 

    // Verificar que la imagen del logo existe
    if (!file_exists($logo_path)) {
        die("Logo not found: " . $logo_path);
    }

    // Convertir la imagen del logo a base64
    $logo_data = base64_encode(file_get_contents($logo_path));

    // Configurar Dompdf
    $options = new Options();
    $options->set('isHtml5ParserEnabled', true);
    $options->set('isRemoteEnabled', true);
    $dompdf = new Dompdf($options);

    // Crear el HTML para el PDF
    $html = '
    <!doctype html>
    <html lang="es">
    <head>
      <meta charset="utf-8">
      <title>Receta Médica</title>
      <style>
        body { font-family: Arial, sans-serif; }
        .header { text-align: center; }
        .header img { width: 100px; margin-bottom: 10px; }
        .header h1 { font-size: 24px; margin: 0; }
        .header p { margin: 5px 0; }
        .content { margin: 20px; }
        .content h2, .content h3 { text-align: center; font-size: 22px; margin-bottom: 20px; }
        .content p { font-size: 14px; margin-bottom: 15px; }
        .details { margin-bottom: 20px; }
        .details p { margin: 5px 0; }
        .prescription p { font-size: 16px; margin-top: 20px; }
      </style>
    </head>
    <body>
      <div class="header">
        <img src="data:image/jpeg;base64,' . $logo_data . '" alt="Logo">
        <h1>' . $clinic_name . '</h1>
        <p>' . $clinic_address_1 . '</p>
        <p>' . $clinic_address_2 . '</p>
        <p>' . $clinic_phone . '</p>
      </div>
      <div class="content">
        <h2>Receta Médica</h2>
        <div class="details">
          <p><strong>Paciente:</strong> ' . $patientName . '</p>
          <p><strong>Dentista:</strong> ' . $medicName . '</p>
        </div>
        <h3>Detalles de la Receta</h3>
        <div class="prescription">
          ' . $prescriptionDetails . '
        </div>
      </div>
    </body>
    </html>
    ';

    // Cargar el HTML en Dompdf
    $dompdf->loadHtml($html);

    // Configurar el tamaño y orientación del papel
    $dompdf->setPaper('A4', 'portrait');

    // Renderizar el PDF
    $dompdf->render();

    // Enviar el PDF al navegador para descarga
    $dompdf->stream('receta_medica.pdf', array('Attachment' => 0));
    exit;
}
else {
    echo "Método de solicitud no permitido.";
}
?>
