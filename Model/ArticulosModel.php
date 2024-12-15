<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Model/BaseDatos.php';

function RegistrarArticuloModel($nombre, $precio, $cantidad, $imagen, $categoriaID, $estadoID) {
    try {
        $enlace = AbrirBD();
        $sentencia = "CALL RegistrarArticulo('$nombre', $precio, $cantidad, '$imagen', $categoriaID, $estadoID)";
        $resultado = $enlace->query($sentencia);

        if ($resultado === false) {
            throw new Exception("Error en la consulta: " . $enlace->error);
        }

        return true;
    } catch (Exception $ex) {
        error_log("Error en RegistrarArticuloModel: " . $ex->getMessage());
        return false;
    } finally {
        CerrarBD($enlace);
    }
}

function ConsultarCategoriasModel() {
    try {
        $enlace = AbrirBD();
        $sentencia = "CALL ConsultarCategorias()";
        $resultado = $enlace->query($sentencia);

        if ($resultado === false) {
            throw new Exception("Error en la consulta: " . $enlace->error);
        }

        return $resultado;
    } catch (Exception $ex) {
        error_log("Error en ConsultarCategoriasModel: " . $ex->getMessage());
        return null;
    } finally {
        CerrarBD($enlace);
    }
}

function ConsultarEstadosModel() {
    try {
        $enlace = AbrirBD();
        $sentencia = "CALL ConsultarEstados()";
        $resultado = $enlace->query($sentencia);

        if ($resultado === false) {
            throw new Exception("Error en la consulta: " . $enlace->error);
        }

        return $resultado;
    } catch (Exception $ex) {
        error_log("Error en ConsultarEstadosModel: " . $ex->getMessage());
        return null;
    } finally {
        CerrarBD($enlace);
    }
}
