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
?>
