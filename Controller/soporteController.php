<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Model/SoporteModel.php';
 
if (isset($_POST["txtSugerencia"])) {
    $sugerencia = $_POST["txtSugerencia"];
    $clienteID = 1; // Cambiar por el ID del cliente autenticado, si aplica
 
    $resultado = RegistrarConsultaModel($sugerencia, $clienteID);
 
    if ($resultado) {
        $mensaje = "¡Sugerencia enviada exitosamente!";
    } else {
        $mensaje = "Hubo un error al enviar la sugerencia.";
    }
 
    echo '<div class="alert alert-' . ($resultado ? 'success' : 'danger') . ' text-center">' . $mensaje . '</div>';
}
?>