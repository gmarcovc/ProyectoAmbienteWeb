<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Model/CarritoModel.php';

    if(session_status() == PHP_SESSION_NONE) {
        session_start();
    }

if (isset($_POST["btnRegistrarCarrito"])) 
{
        $consecutivoArticulo = $_POST["ID_ARTICULO"];
        $cantidad = $_POST["CANTIDAD"];
    
    
        $resultado = RegistrarCarritoModel($SESSION["clienteID"], $ArticuloID, $cantidad );
    
        if ($resultado == true) 
        {
            header('location: ../../View/Articulos/consultarArticulos.php');
        }
         else 
         {
            $_POST["txtMensaje"] = "El artículo no se ha registrado correctamente.";
        }
}
?>