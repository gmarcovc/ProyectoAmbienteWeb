<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/View/layout.php';
    include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Controller/ArticulosController.php';
?>

<!doctype html>
<html lang="en">

<?php
    ReferenciasCSS();
?>

<body class="page-wrapper radial-gradient">

    <!-- Incluir el layout y mostrar el menú -->
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed" 
        <?php
            MostrarMenu();
        ?>

        <div class="body-wrapper">          
        <?php
            MostrarHeader();
        ?> 

            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <!-- Formulario para registrar artículo -->
                        <h5 class="card-title fw-semibold mb-4">Registrar Artículo</h5>

                        <form action="RegistrarArticulos.php" method="POST" enctype="multipart/form-data">

                            <div class="mb-3">
                                <label class="form-label">Nombre del Artículo</label>
                                <input type="text" class="form-control" id="txtNombre" name="txtNombre" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Descripción</label>
                                <textarea class="form-control" id="txtDescripcion" name="txtDescripcion" required></textarea>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Categoría</label>
                                <select id="ddlCategorias" name="ddlCategorias" class="form-control" required>
                                    <option value="">Seleccione</option>
                                    <option value="1">Electrónica</option>
                                    <option value="2">Ropa</option>
                                </select>
                            </div>

                            <div class="mb-4">
                                <label class="form-label">Precio</label>
                                <input type="number" step="0.01" class="form-control" id="txtPrecio" name="txtPrecio" required>
                            </div>

                            <div class="mb-4">
                                <label class="form-label">Cantidad en Inventario</label>
                                <input type="number" class="form-control" id="txtCantidad" name="txtCantidad" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Imagen del Artículo</label>
                                <input type="file" class="form-control" id="txtImagen" name="txtImagen" required>
                            </div>

                            <div class="mb-4">
                                <label class="form-label">Estado</label>
                                <select id="ddlEstado" name="ddlEstado" class="form-control" required>
                                    <option value="1">Activo</option>
                                    <option value="2">Inactivo</option>
                                </select>
                            </div>

                            <input type="submit" class="btn btn-primary" value="Registrar Artículo" id="btnRegistrarArticulo" name="btnRegistrarArticulo">

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Referencias a los archivos JS, si son necesarios -->
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.bundle.min.js"></script>
</body>

</html>
