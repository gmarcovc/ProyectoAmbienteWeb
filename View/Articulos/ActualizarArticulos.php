<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/View/layout.php';
include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Controller/ArticulosController.php';

// Obtener el ID del artículo a actualizar
$id = intval($_GET["id"]);
$datos = ConsultarArticulo($id);

if ($datos === null) {
    die("No se encontró el artículo con ID $id.");
}

$categorias = ConsultarCategorias();
$estados = ConsultarEstados();
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
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title fw-semibold mb-4">Actualizar Artículo</h5>

                            <?php if (isset($_GET["mensaje"])): ?>
                                <div class="alert alert-info text-center">
                                    <?= htmlspecialchars($_GET["mensaje"]) ?>
                                </div>
                            <?php endif; ?>

                            <form action="/ProyectoAmbienteWeb/Controller/ArticulosController.php" method="POST" enctype="multipart/form-data">
                                <input type="hidden" id="txtConsecutivo" name="txtConsecutivo" value="<?= htmlspecialchars($datos["articuloID"]) ?>">

                                <div class="mb-3">
                                    <label class="form-label">Nombre</label>
                                    <input type="text" class="form-control" id="txtNombre" name="txtNombre"
                                           value="<?= htmlspecialchars($datos["nombre"]) ?>" required>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Descripción</label>
                                    <textarea class="form-control" id="txtDescripcion" name="txtDescripcion" required><?= htmlspecialchars($datos["descripcion"]) ?></textarea>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Precio</label>
                                    <input type="number" step="0.01" class="form-control" id="txtPrecio" name="txtPrecio"
                                           value="<?= htmlspecialchars($datos["precio"]) ?>" required>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Cantidad</label>
                                    <input type="number" class="form-control" id="txtCantidad" name="txtCantidad"
                                           value="<?= htmlspecialchars($datos["cantidad"]) ?>" required>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Categoría</label>
                                    <select id="ddlCategoria" name="ddlCategoria" class="form-control" required>
                                        <?php while ($categoria = $categorias->fetch_assoc()): ?>
                                            <option value="<?= htmlspecialchars($categoria['categoriaID']) ?>" <?= ($datos['categoriaID'] == $categoria['categoriaID']) ? 'selected' : '' ?>>
                                                <?= htmlspecialchars($categoria['nombre']) ?>
                                            </option>
                                        <?php endwhile; ?>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Estado</label>
                                    <select id="ddlEstado" name="ddlEstado" class="form-control" required>
                                        <?php while ($estado = $estados->fetch_assoc()): ?>
                                            <option value="<?= htmlspecialchars($estado['estadoID']) ?>" <?= ($datos['estadoID'] == $estado['estadoID']) ? 'selected' : '' ?>>
                                                <?= htmlspecialchars($estado['nombreEstado']) ?>
                                            </option>
                                        <?php endwhile; ?>
                                    </select>
                                </div>

                                <div class="mb-4">
                                    <label class="form-label">Imagen</label>
                                    <div class="row">
                                        <div class="col-10">
                                            <input type="file" class="form-control" id="txtImagen" name="txtImagen"
                                                   accept="image/png, image/jpg, image/jpeg">
                                        </div>
                                        <div class="col-2">
                                            <img width="175" height="150" src="<?= htmlspecialchars($datos["imagen"]) ?>" alt="Imagen actual">
                                        </div>
                                    </div>
                                </div>

                                <button type="submit" class="btn btn-primary" id="btnActualizarArticulo" name="btnActualizarArticulo">
                                    Actualizar Artículo
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <?php ReferenciasJS(); ?>
</body>
</html>
