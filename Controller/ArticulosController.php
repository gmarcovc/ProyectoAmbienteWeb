<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Model/ArticulosModel.php';

if(session_status() == PHP_SESSION_NONE) {
    session_start();
}

function ConsultarArticulos()
{
    return ConsultarArticulosModel();
}

function ConsultarArticulo($articuloID) {
    $resultado = ConsultarArticuloModel($articuloID);

    if($resultado != null && $resultado -> num_rows > 0)
    {
        return mysqli_fetch_array($resultado);
    }
    else
    {
        $_POST["txtMensaje"] = "La información del producto no se ha obtenido correctamente";
        header('location: ../../View/Articulos/consultarArticulos.php');
    }
}

if (isset($_POST["btnRegistrarArticulo"])) {
    $nombre = $_POST["txtNombre"];
    $precio = $_POST["txtPrecio"];
    $cantidad = $_POST["txtCantidad"];
    $imagen = '/ProyectoAmbienteWeb/View/images/articulos/' . $_FILES["txtImagen"]["name"];
    $categoriaID = $_POST["ddlCategorias"];

    $origen = $_FILES["txtImagen"]["tmp_name"];
    $destino = $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/View/images/articulos/' .  $_FILES["txtImagen"]["name"];
    copy($origen,$destino);

    $resultado = RegistrarArticuloModel($nombre, $precio, $cantidad, $imagen, $categoriaID);

    if ($resultado == true) {
        header('location: ../../View/Articulos/ConsultarArticulos.php');
        exit();
    } else {
        $_POST["txtMensaje"] = "No fue posible registrar el artículo";
    }
}


if(isset($_POST["btnActualizarArticulo"]))
{
    $articuloID = $_POST["txtArticuloID"];
    $nombre = $_POST["txtNombre"];
    $precio = $_POST["txtPrecio"];
    $cantidad = $_POST["txtCantidad"];
    $imagen = "";

    if($_FILES["txtImagen"]["name"] != "")
    {
        $imagen = '/ProyectoAmbienteWeb/View/images/articulos/' . $_FILES["txtImagen"]["name"];

        $origen = $_FILES["txtImagen"]["tmp_name"];
        $destino = $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/View/images/articulos/' .  $_FILES["txtImagen"]["name"];
        copy($origen,$destino);
    }

    $categoriaID = $_POST["ddlCategorias"];

    $resultado = ActualizarArticuloModel($articuloID, $nombre, $precio, $cantidad, $imagen, $categoriaID);

    if($resultado == true)
    {
        header('location: ../../View/Articulos/consultarArticulos.php');
    }
    else
    {
        $_POST["txtMensaje"] = "El producto no se ha actualizado correctamente";
    }
    
}

function ConsultarCategorias() {
    return ConsultarCategoriasModel();
}

include_once $_SERVER["DOCUMENT_ROOT"] . '/Model/ArticulosModel.php';

function EliminarArticulo($articuloID) {
    $resultado = EliminarArticuloModel($articuloID);

    if ($resultado) {
        $_POST["txtMensaje"] = "El artículo se ha eliminado correctamente.";
    } else {
        $_POST["txtMensaje"] = "No se pudo eliminar el artículo.";
    }

    header('location: ../../View/Articulo/consultarArticulos.php');
}

if (isset($_GET['accion']) && $_GET['accion'] === 'eliminar') {
    $id = intval($_GET['id']);
    EliminarArticulo($id);
}

?>
