<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Model/ArticulosModel.php';

function ConsultarCategorias() {
    $resultado = ConsultarCategoriasModel();
    if ($resultado != null && $resultado->num_rows > 0) {
        return $resultado;
    }
    return [];
}

function ConsultarEstados() {
    $resultado = ConsultarEstadosModel();
    if ($resultado != null && $resultado->num_rows > 0) {
        return $resultado;
    }
    return [];
}

function ConsultarArticulos()
{
    return ConsultarArticuloModel();
}

function ConsultarArticulo($consecutivo)
{
    $resultado = ConsultarArticuloModel($consecutivo);

    if ($resultado != null && $resultado->num_rows > 0) 
    {
        return mysqli_fetch_array($resultado);
    } 
    else 
    {
        $_POST["txtMensaje"] = "La información del artículo no se ha obtenido correctamente";
        header('location: ../../View/Articulo/consultarArticulos.php');
    }
}

?>
