<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Model/BaseDatos.php';

  function RegistrarCarritoModel($ClienteID, $ArticuloID, $cantidad) 
{
    try {
        $enlace = AbrirBD();

        $sentencia = "RegistrarCarrito('$ClienteID, $ArticuloID, $cantidad)";
        $resultado = $enlace->query($sentencia);

        CerrarBD($enlace);
        return $resultado;
    } 
    catch (Exception $ex) {
        return false;
    }
}


?>
