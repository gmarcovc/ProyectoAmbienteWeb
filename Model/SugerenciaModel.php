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
        die("Error al ejecutar el procedimiento almacenado: " . $ex->getMessage());
    }
}
?>
