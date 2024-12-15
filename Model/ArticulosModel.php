<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Model/BaseDatos.php';

function ConsultarArticulosModel()
{
    try
    {
        $enlace = AbrirBD();

        $sentencia = "CALL ConsultarArticulos()";
        $resultado = $enlace -> query($sentencia);

        CerrarBD($enlace);
        return $resultado;
    }
    catch(Exception $ex)
    {
        return null;
    }
}

function ConsultarArticuloModel($articuloID)
{
    try
    {
        $enlace = AbrirBD();

        $sentencia = "CALL ConsultarArticulo('$articuloID')";
        $resultado = $enlace -> query($sentencia);

        CerrarBD($enlace);
        return $resultado;
    }
    catch(Exception $ex)
    {
        return null;
    }
}

function RegistrarArticuloModel($nombre, $precio, $cantidad, $imagen, $categoriaID) {
    try {
        $enlace = AbrirBD();
        $sentencia = "CALL RegistrarArticulo('$nombre', '$precio', '$cantidad', '$imagen', '$categoriaID')";
        $resultado = $enlace->query($sentencia);

        CerrarBD($enlace);
        return $resultado;
    }
    catch(Exception $ex)
    {
        return false;
    }
}

function ActualizarArticuloModel($articuloID, $nombre, $precio, $cantidad, $imagen, $categoriaID) {
    try {
        $enlace = AbrirBD();

        $sentencia = "CALL ActualizarArticulo('$articuloID', '$nombre', '$precio', '$cantidad', '$imagen', '$categoriaID')";
        $resultado = $enlace->query($sentencia);

        CerrarBD($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return false;
        }
    }

function ConsultarCategoriasModel() {
    try {
        $enlace = AbrirBD();

        $sentencia = "CALL ConsultarCategorias()";
        $resultado = $enlace->query($sentencia);

        CerrarBD($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return false;
        }
    }
?>
