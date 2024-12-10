<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Controller/soporteController.php';
?>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Soporte</title>
    <link rel="shortcut icon" type="image/png" href="../images/logo-01.jpeg" />
    <link rel="stylesheet" href="../css/styles.min.css" />
    <link rel="stylesheet" href="../css/proyecto.css" />
</head>

<body>
    <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed">
        <div
            class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
            <div class="d-flex align-items-center justify-content-center w-100">
                <div class="row justify-content-center w-100">
                    <div class="col-md-8 col-lg-6 col-xxl-4">
                        <div class="card mb-0">
                            <div class="card-body">
                                <a href="home.php" class="logo-container">
                                    <img src="../images/logo-01.jpeg" alt="Logo">
                                </a>
                                
                                <h3 class="text-center mb-4">Soporte</h3>
                                <p class="text-center">Envíanos tus sugerencias</p>

                                <?php
                                    if (isset($_POST["txtSugerencia"])) {
                                        echo '<div class="alert alert-success text-center">¡Sugerencia enviada exitosamente!</div>';
                                    }
                                ?>

                                <form action="" method="POST">
                                    <div class="mb-3">
                                        <label class="form-label">Correo Electrónico</label>
                                        <input type="email" class="form-control" id="txtCorreo" name="txtCorreo" required>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Sugerencia</label>
                                        <textarea class="form-control" id="txtSugerencia" name="txtSugerencia" rows="5" required></textarea>
                                    </div>

                                    <button type="submit" class="btn btn-primary w-100 py-2 fs-5">Enviar Sugerencia</button>
                                </form>
                                
                                <div class="mt-3 text-center">
                                    <a href="home.php" class="text-primary fw-bold">Regresar al Inicio</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
</body>

</html>
