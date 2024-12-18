<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Model/BaseDatos.php';

function RegistrarSugerenciaModel($descripcion, $clienteID) {
    try {
        $enlace = AbrirBD(); 
        $sentencia = "CALL InsertarSugerencia('$descripcion', $clienteID)";
        $resultado = $enlace->query($sentencia);
        CerrarBD($enlace); 
        return $resultado;
    } catch (Exception $ex) {
        return false;
    }
}

function ConsultarSugerenciasModel($clienteID) {
    try {
        $enlace = AbrirBD();
        $sentencia = "CALL ConsultarSugerencias($clienteID)";
        $resultado = $enlace->query($sentencia);
        CerrarBD($enlace);
        return $resultado;
    } catch (Exception $ex) {
        return null;
    }
}


?>
