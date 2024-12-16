<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Model/BaseDatos.php';


function RegistrarConsultaModel($descripcion, $clienteID) {
    try {
        $enlace = AbrirBD(); 
        $sentencia = "CALL RegistrarConsulta('$descripcion', $clienteID)";
        $resultado = $enlace->query($sentencia);
        CerrarBD($enlace); 
        return $resultado;
    } catch (Exception $ex) {
        return false;
    }
}

function ConsultarSugerenciasModel()
    {
        try
        {
            $enlace = AbrirBD();

            $sentencia = "CALL ConsultarSugerencias()";
            $resultado = $enlace->query($sentencia);

            CerrarBD($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return null;
        }
    }
?>