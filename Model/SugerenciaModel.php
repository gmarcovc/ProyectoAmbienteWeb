<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Model/BaseDatos.php';

function RegistrarSugerenciaModel($descripcion, $clienteID, $nombreCliente) {
    try {
        $enlace = AbrirBD();
        $stmt = $enlace->prepare("CALL InsertarSugerencia(?, ?, ?)");
        $stmt->bind_param("sis", $descripcion, $clienteID, $nombreCliente);
        $resultado = $stmt->execute();

        $stmt->close();
        CerrarBD($enlace);

        return $resultado;
    } catch (Exception $ex) {
        error_log("Error en RegistrarSugerenciaModel: " . $ex->getMessage());
        return false;
    }
}

function ConsultarSugerenciasModel() {
    try {
        $enlace = AbrirBD();
        $sentencia = "CALL ConsultarSugerencias()";
        $resultado = $enlace->query($sentencia);

        CerrarBD($enlace);
        return $resultado;
    } catch (Exception $ex) {
        error_log("Error en ConsultarSugerenciasModel: " . $ex->getMessage());
        return null;
    }
}

function EliminarSugerenciaModel($consultaID) {
    try {
        $enlace = AbrirBD();
        $stmt = $enlace->prepare("CALL EliminarSugerencia(?)");
        $stmt->bind_param("i", $consultaID);
        $resultado = $stmt->execute();

        $stmt->close();
        CerrarBD($enlace);

        return $resultado;
    } catch (Exception $ex) {
        error_log("Error en EliminarSugerenciaModel: " . $ex->getMessage());
        return false;
    }
}

?>
