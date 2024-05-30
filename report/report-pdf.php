<?php
include "../core/autoload.php";
include "../core/app/model/ReservationData.php";
include "../core/app/model/PacientData.php";
include "../core/app/model/MedicData.php";
include "../core/app/model/StatusData.php";
include "../core/app/model/PaymentData.php";
session_start();

require_once '../vendor/autoload.php'; // Asegúrate de que la ruta sea correcta
use Dompdf\Dompdf;

if (!isset($_SESSION["report_data"])) {
    die("No data to generate report.");
}

$users = $_SESSION["report_data"];
$total = 0;

$html = '<h1>Reporte de Citas</h1>';
$html .= '<table border="1" cellpadding="5">';
$html .= '<thead>';
$html .= '<tr>';
$html .= '<th>Asunto</th>';
$html .= '<th>Paciente</th>';
$html .= '<th>Dentista</th>';
$html .= '<th>Fecha</th>';
$html .= '<th>Estado</th>';
$html .= '<th>Pago</th>';
$html .= '<th>Costo</th>';
$html .= '</tr>';
$html .= '</thead>';
$html .= '<tbody>';

foreach ($users as $user) {
    $pacient = $user->getPacient();
    $medic = $user->getMedic();
    $html .= '<tr>';
    $html .= '<td>' . $user->title . '</td>';
    $html .= '<td>' . $pacient->name . ' ' . $pacient->lastname . '</td>';
    $html .= '<td>' . $medic->name . ' ' . $medic->lastname . '</td>';
    $html .= '<td>' . $user->date_at . ' ' . $user->time_at . '</td>';
    $html .= '<td>' . $user->getStatus()->name . '</td>';
    $html .= '<td>' . $user->getPayment()->name . '</td>';
    $html .= '<td>Q ' . number_format($user->price, 2, ".", ",") . '</td>';
    $html .= '</tr>';
    $total += $user->price;
}

$html .= '</tbody>';
$html .= '</table>';
$html .= '<h2>Total: Q ' . number_format($total, 2, ".", ",") . '</h2>';

// Initialize Dompdf
$dompdf = new Dompdf();
$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'portrait');
$dompdf->render();

// Output the generated PDF
$dompdf->stream("reporte_citas.pdf", array("Attachment" => 1));
