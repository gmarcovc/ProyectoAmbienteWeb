<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Model/ArticulosModel.php';

if (isset($_POST["btnRegistrarArticulo"])) {
    $nombre = $_POST["txtNombre"];
    $precio = $_POST["txtPrecio"];
    $cantidad = $_POST["txtCantidad"];
    $imagen = '/View/products_images/' . $_FILES["txtImagen"]["name"];
    $categoriaID = $_POST["ddlCategorias"];
    $estadoID = $_POST["ddlEstados"];

    $origen = $_FILES["txtImagen"]["tmp_name"];
    $destino = $_SERVER["DOCUMENT_ROOT"] . $imagen;
    copy($origen, $destino);

    $resultado = RegistrarArticuloModel($nombre, $precio, $cantidad, $imagen, $categoriaID, $estadoID);

    if ($resultado == true) {
        header('location: ../../View/Articulos/consultarArticulos.php');
    } else {
        $_POST["txtMensaje"] = "El artículo no se ha registrado correctamente.";
    }
}

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
