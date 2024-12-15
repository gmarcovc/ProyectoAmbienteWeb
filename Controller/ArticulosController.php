<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Model/ArticulosModel.php';

if (isset($_POST["btnRegistrarArticulo"])) {
    if (empty($_POST["txtNombre"]) || empty($_POST["txtPrecio"]) || 
        empty($_POST["ddlCategorias"]) || empty($_FILES["txtImagen"]["name"])) {
        $mensajeError = "Datos incompletos para registrar el artículo.";
        include $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/View/Articulos/RegistrarArticulos.php';
        exit;
    }

    $nombre = $_POST["txtNombre"];
    $precio = floatval($_POST["txtPrecio"]);
    $cantidad = intval($_POST["txtCantidad"]);
    $categoriaID = intval($_POST["ddlCategorias"]);
    $estadoID = intval($_POST["ddlEstados"]);
    $imagen = '/ProyectoAmbienteWeb/View/images/products/' . basename($_FILES["txtImagen"]["name"]);

    // Verificar si el directorio de imágenes existe
    $directorioImagenes = $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/View/images/products/';
    if (!is_dir($directorioImagenes)) {
        mkdir($directorioImagenes, 0777, true);
    }

    // Mover el archivo subido
    $origen = $_FILES["txtImagen"]["tmp_name"];
    $destino = $directorioImagenes . basename($_FILES["txtImagen"]["name"]);

    if (!move_uploaded_file($origen, $destino)) {
        $mensajeError = "Error al guardar la imagen.";
        include $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/View/Articulos/RegistrarArticulos.php';
        exit;
    }

    // Registrar el artículo en la base de datos
    $resultado = RegistrarArticuloModel($nombre, $precio, $cantidad, $imagen, $categoriaID, $estadoID);

    if ($resultado === true) {
        header('Location: /ProyectoAmbienteWeb/View/Articulos/ConsultarArticulos.php');
        exit;
    } else {
        $mensajeError = "El artículo no se ha registrado correctamente.";
        include $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/View/Articulos/RegistrarArticulos.php';
    }
}

function ConsultarCategorias() {
    $resultado = ConsultarCategoriasModel();
    return ($resultado != null) ? $resultado : null;
}

function ConsultarEstados() {
    $resultado = ConsultarEstadosModel();
    return ($resultado != null) ? $resultado : null;
}
