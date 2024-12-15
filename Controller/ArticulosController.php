<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Model/ArticulosModel.php';

// Registrar un nuevo artículo
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

    // Crear directorio si no existe
    $directorioImagenes = $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/View/images/products/';
    if (!is_dir($directorioImagenes)) {
        mkdir($directorioImagenes, 0777, true);
    }

    // Mover la imagen subida
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
        header('Location: /ProyectoAmbienteWeb/View/Articulos/ConsultarArticulos.php?mensaje=Artículo registrado correctamente');
        exit;
    } else {
        $mensajeError = "El artículo no se ha registrado correctamente.";
        include $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/View/Articulos/RegistrarArticulos.php';
    }
}

// Actualizar un artículo existente
if (isset($_POST["btnActualizarArticulo"])) {
    $articuloID = intval($_POST["txtConsecutivo"]);
    $nombre = $_POST["txtNombre"];
    $descripcion = $_POST["txtDescripcion"];
    $precio = floatval($_POST["txtPrecio"]);
    $cantidad = intval($_POST["txtCantidad"]);
    $categoriaID = intval($_POST["ddlCategoria"]);
    $estadoID = intval($_POST["ddlEstado"]);

    // Manejo de la imagen (opcional)
    $imagen = '';
    if (!empty($_FILES["txtImagen"]["name"])) {
        $nombreImagen = basename($_FILES["txtImagen"]["name"]);
        $rutaImagen = '/ProyectoAmbienteWeb/View/images/products/' . $nombreImagen;
        $destino = $_SERVER["DOCUMENT_ROOT"] . $rutaImagen;

        // Crear el directorio si no existe
        if (!is_dir(dirname($destino))) {
            mkdir(dirname($destino), 0777, true);
        }

        // Mover el archivo al directorio de destino
        if (!move_uploaded_file($_FILES["txtImagen"]["tmp_name"], $destino)) {
            header("Location: /ProyectoAmbienteWeb/View/Articulos/ActualizarArticulos.php?id=$articuloID&mensaje=Error al subir la imagen");
            exit;
        }

        $imagen = $rutaImagen;
    }

    // Llamar al modelo para actualizar el artículo
    $resultado = ActualizarArticuloModel($articuloID, $nombre, $descripcion, $precio, $cantidad, $imagen, $categoriaID, $estadoID);

    if ($resultado) {
        header("Location: /ProyectoAmbienteWeb/View/Articulos/ConsultarArticulos.php?mensaje=Artículo actualizado correctamente");
        exit;
    } else {
        header("Location: /ProyectoAmbienteWeb/View/Articulos/ActualizarArticulos.php?id=$articuloID&mensaje=Error al actualizar el artículo");
        exit;
    }
}

// Función para consultar un artículo por ID
function ConsultarArticulo($articuloID) {
    return ConsultarArticuloModel($articuloID);
}

// Función para obtener categorías
function ConsultarCategorias() {
    return ConsultarCategoriasModel();
}

// Función para obtener estados
function ConsultarEstados() {
    return ConsultarEstadosModel();
}

// Función para consultar todos los artículos
function ConsultarArticulos() {
    return ConsultarArticulosModel();
}
?>
