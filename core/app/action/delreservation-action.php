<?php
/**
* Clinica Dental Gill & Torres
* @author Grupo #1
**/
$user = ReservationData::getById($_GET["id"]);
$user->del();
print "<script>window.location='index.php?view=reservations';</script>";

?>