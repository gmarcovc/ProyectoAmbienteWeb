<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/View/layout.php';
include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Controller/ArticulosController.php';
?>

<!doctype html>
<html lang="en">

<?php ReferenciasCSS(); ?>

<body class="page-wrapper radial-gradient">
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed">
        <?php MostrarMenu(); ?>

        <div class="body-wrapper">
            <?php MostrarHeader(); ?>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <h5 class="card-title fw-semibold mb-4">Registro y consulta de artículos</h5>

                        <a href="/ProyectoAmbienteWeb/View/Articulos/ConsultarArticulos.php" class="btn btn-success">
                            Consultar Artículos
                        </a>

                        <label class="form-label">...</label>

                        <form action="/ProyectoAmbienteWeb/Controller/ArticulosController.php" method="POST" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label class="form-label">Nombre del Artículo</label>
                                <input type="text" class="form-control" id="txtNombre" name="txtNombre" required>
                            </div>



                            <?php
                            $categorias = ConsultarCategorias();
                            $estados = ConsultarEstados();

                            $estadosArray = [];
                            if ($estados != null) {
                                while ($fila = $estados->fetch_assoc()) {
                                    $estadosArray[] = $fila;
                                }
                            }
                            ?>

                            <div class="mb-3">
                                <label class="form-label">Categoría</label>
                                <select id="ddlCategorias" name="ddlCategorias" class="form-control" required>
                                    <option value="">Seleccione</option>
                                    <?php if ($categorias != null): ?>
                                        <?php while ($fila = $categorias->fetch_assoc()): ?>
                                            <option value="<?= htmlspecialchars($fila['categoriaID']) ?>">
                                                <?= htmlspecialchars($fila['nombre']) ?>
                                            </option>
                                        <?php endwhile; ?>
                                    <?php else: ?>
                                        <option value="">No hay categorías disponibles</option>
                                    <?php endif; ?>
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

                            <div class="mb-3">
                                <label class="form-label">Estado</label>
                                <select id="ddlEstados" name="ddlEstados" class="form-control" required>
                                    <option value="">Seleccione</option>
                                    <?php if (!empty($estadosArray)): ?>
                                        <?php foreach ($estadosArray as $estado): ?>
                                            <option value="<?= htmlspecialchars($estado['estadoID']) ?>">
                                                <?= htmlspecialchars($estado['nombreEstado']) ?>
                                            </option>
                                        <?php endforeach; ?>
                                    <?php else: ?>
                                        <option value="">No hay estados disponibles</option>
                                    <?php endif; ?>
                                </select>
                            </div>

                            <input type="submit" class="btn btn-primary" value="Registrar Artículo" id="btnRegistrarArticulo" name="btnRegistrarArticulo">

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="/ProyectoAmbienteWeb/View/js/jquery.min.js"></script>
    <script src="/ProyectoAmbienteWeb/View/js/bootstrap.bundle.min.js"></script>
</body>

</html>