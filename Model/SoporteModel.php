<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Model/BaseDatos.php';


function RegistrarConsultaModel($descripcion, $clienteID) {
    try {
        $enlace = AbrirBD(); // Suponiendo que tienes una función para abrir la conexión a la BD
        $sentencia = "CALL RegistrarConsulta('$descripcion', $clienteID)";
        $resultado = $enlace->query($sentencia);
        CerrarBD($enlace); // Suponiendo que tienes una función para cerrar la conexión a la BD
        return $resultado;
    } catch (Exception $ex) {
        return false;
    }
}
?>