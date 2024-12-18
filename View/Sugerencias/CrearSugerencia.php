<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/View/layout.php';
include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Controller/SugerenciaController.php';
?>

<!doctype html>
<html lang="en">
<?php ReferenciasCSS(); ?>

<body class="page-wrapper radial-gradient">
    <div id="main-wrapper">
        <?php MostrarMenu(); ?>
        <div class="body-wrapper">
            <?php MostrarHeader(); ?>
            <div class="container-fluid">
                <div class="row">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="card-title fw-semibold mb-4 text-center">Nos encanta escucharte</h3>
                            <h5 class="text-center">Envíanos tus sugerencias</h5>
                            <form action="" method="POST">
                                <div class="mb-3">
                                    <textarea class="form-control" id="txtSugerencia" name="txtSugerencia" rows="5" required></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary w-100 py-2 fs-5">Enviar Sugerencia</button>
                            </form>
                            <div class="mt-3 text-center">
                                <a href="../Login/home.php" class="text-primary fw-bold">Regresar al Inicio</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php ReferenciasJS(); ?>
</body>
</html>
