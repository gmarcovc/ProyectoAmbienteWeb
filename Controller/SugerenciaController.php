<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Model/SugerenciaModel.php';

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

if (isset($_POST["txtSugerencia"])) {
    $sugerencia = $_POST["txtSugerencia"];
    $anonimo = isset($_POST["chkAnonimo"]) && $_POST["chkAnonimo"] == 'on';

    // Determinar si es anónimo o lleva el clienteID
    $clienteID = $anonimo ? null : ($_SESSION['clienteID'] ?? null);

    if ($anonimo) {
        $nombreCliente = "Anónimo";
    } else {
        $nombreCliente = $_SESSION['NombreCliente'] ?? "Desconocido";
    }

    // Registrar la sugerencia
    $resultado = RegistrarSugerenciaModel($sugerencia, $clienteID, $nombreCliente);

    if ($resultado) {
        $mensaje = $anonimo ? "¡Sugerencia enviada de forma anónima!" : "¡Sugerencia enviada exitosamente!";
    } else {
        $mensaje = "Hubo un error al enviar la sugerencia.";
    }

    echo '<div class="alert alert-' . ($resultado ? 'success' : 'danger') . ' text-center">' . $mensaje . '</div>';
}

if (isset($_POST['eliminarID'])) {
    $consultaID = $_POST['eliminarID'];

    $resultado = EliminarSugerenciaModel($consultaID);

    if ($resultado) {
        $_SESSION['mensaje'] = "¡Sugerencia eliminada exitosamente!";
    } else {
        $_SESSION['mensaje'] = "Hubo un error al eliminar la sugerencia.";
    }

    header("Location: ConsultarSugerencia.php");
    exit;
}

function ConsultarSugerencias() {
    return ConsultarSugerenciasModel();
}
?>
