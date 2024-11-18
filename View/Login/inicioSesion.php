<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Controller/LoginController.php';
?>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Iniciar Sesión</title>
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
                    <div class="col-md-8 col-lg-6 col-xxl-3">
                        <div class="card mb-0">
                            <div class="card-body">
                            <a href="home.php" class="logo-container">
                                    <img src="../images/logo-01.jpeg" alt="Logo">
                                </a>

                                <p class="text-center">Iniciar sesión</p>

                                <?php
                                    if(isset($_POST["txtMensaje"]))
                                    {
                                        echo '<div class="alert alert-info Centrado">' . $_POST["txtMensaje"] . '</div>';
                                    }
                                ?>

                                <form action="" method="POST">

                                    <div class="mb-3">
                                        <label class="form-label">Correo Electrónico</label>
                                        <input type="email" class="form-control" id="txtCorreo" name="txtCorreo">
                                    </div>

                                    <div class="mb-4">
                                        <label class="form-label">Contraseña</label>
                                        <input type="password" class="form-control" id="txtContrasena" name="txtContrasena">
                                    </div>

                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <div class="form-check">
                                        </div>
                                        <a class="text-primary fw-bold" href="recuperarAcceso.php">Recuperar Acceso</a>
                                    </div>
                                    
                                    <a href="home.php" class="btn btn-primary w-100 py-8 fs-4 mb-4">Iniciar Sesión</a>
                                    <div class="d-flex align-items-center justify-content-center">
                                        <p class="fs-4 mb-0 fw-bold">No tienes cuenta?</p>
                                        <a class="text-primary fw-bold ms-2" href="registrarCliente.php">Crear una
                                            cuenta</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
</body>

</html>