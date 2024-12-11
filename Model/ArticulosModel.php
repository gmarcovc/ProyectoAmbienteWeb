<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Model/BaseDatos.php';

function ConsultarCategoriasModel() {
    try {
        $enlace = AbrirBD();
        $sentencia = "SELECT categoriaID, nombre FROM categorias";
        $resultado = $enlace->query($sentencia);
        CerrarBD($enlace);
        return $resultado;
    } catch (Exception $ex) {
        error_log($ex->getMessage());
        return null;
    }
}

function ConsultarEstadosModel() {
    try {
        $enlace = AbrirBD();
        $sentencia = "SELECT estadoID, nombreEstado FROM estados";
        $resultado = $enlace->query($sentencia);
        CerrarBD($enlace);
        return $resultado;
    } catch (Exception $ex) {
        error_log($ex->getMessage());
        return null;
    }
}

function ConsultarArticulosModel()
{
    try
    {
        $enlace = AbrirBD();
        $sentencia = "CALL ConsultarArticulos()";
        $resultado = $enlace->query($sentencia);
        CerrarBD($enlace); 
        return $resultado; 
    }
    catch(Exception $ex)
    {
        return null;  
    }
}

function ConsultarArticuloModel()
    {
        try
        {
            $enlace = AbrirBD(); 
            $sentencia = "CALL ConsultarArticulos()";
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
