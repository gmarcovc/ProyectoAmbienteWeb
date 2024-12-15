<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Model/BaseDatos.php';

// Registrar un nuevo artículo
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

// Consultar todas las categorías
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

// Consultar todos los estados
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

// Consultar todos los artículos
function ConsultarArticulosModel() {
    try {
        $enlace = AbrirBD();
        $sentencia = "CALL ConsultarArticulos()"; 
        $resultado = $enlace->query($sentencia);

        if ($resultado === false) {
            throw new Exception("Error en la consulta: " . $enlace->error);
        }

        return $resultado;
    } catch (Exception $ex) {
        error_log("Error en ConsultarArticulosModel: " . $ex->getMessage());
        return null;
    } finally {
        CerrarBD($enlace);
    }
}

// Consultar un artículo específico por su ID
function ConsultarArticuloModel($articuloID) {
    try {
        $enlace = AbrirBD();
        $sentencia = "CALL ConsultarArticulo($articuloID)"; 
        $resultado = $enlace->query($sentencia);

        if ($resultado === false) {
            throw new Exception("Error en la consulta: " . $enlace->error);
        }

        return $resultado->fetch_assoc(); 
    } catch (Exception $ex) {
        error_log("Error en ConsultarArticuloModel: " . $ex->getMessage());
        return null;
    } finally {
        CerrarBD($enlace);
    }
}

// Actualizar un artículo existente
function ActualizarArticuloModel($articuloID, $nombre, $descripcion, $precio, $cantidad, $imagen, $categoriaID, $estadoID) {
    try {
        $enlace = AbrirBD();

        // Si no hay imagen nueva, se actualiza manteniendo la actual
        $sentencia = $imagen
            ? "CALL ActualizarArticulo($articuloID, '$nombre', '$descripcion', $precio, $cantidad, '$imagen', $categoriaID, $estadoID)"
            : "CALL ActualizarArticulo($articuloID, '$nombre', '$descripcion', $precio, $cantidad, '', $categoriaID, $estadoID)";

        $resultado = $enlace->query($sentencia);

        if ($resultado === false) {
            throw new Exception("Error en la consulta: " . $enlace->error);
        }

        return true; 
    } catch (Exception $ex) {
        error_log("Error en ActualizarArticuloModel: " . $ex->getMessage());
        return false; 
    } finally {
        CerrarBD($enlace);
    }
}
?>
