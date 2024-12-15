<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Controller/LoginController.php';

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

function MostrarMenu()
{
    if (isset($_SESSION["NombreCliente"]) && $_SESSION["RolID"] == "1") {
        echo '		
                    <!-- para admins -->
		            <div class="container-menu-desktop">
			            <div class="top-bar">
				            <div class="content-topbar flex-sb-m h-full container">
				                <div class="left-top-bar">
					                Vista Administrador: ' . $_SESSION["NombreCliente"] . '
				                </div>

				            <div class="right-top-bar flex-w h-full">

					            <a href="../Cliente/consultarClientes.php" class="flex-c-m trans-04 p-lr-25">
							        Clientes
						        </a>
                                <!-- Botón Artículos -->
						        <a href="../Articulos/registrarArticulos.php" class="flex-c-m trans-04 p-lr-25">
							        Artículos
						        </a>

                                <a href="../Soporte/consultarSolicitudes.php" class="flex-c-m trans-04 p-lr-25">
							        Solicitudes  
						        </a>

				            </div>
			            </div>
		            </div>';
    } else if (isset($_SESSION["NombreCliente"]) && $_SESSION["RolID"] == "2") {
        echo '		
                <!-- para clientes -->
                <div class="container-menu-desktop">
                    <div class="top-bar">
                        <div class="content-topbar flex-sb-m h-full container">
                            <div class="left-top-bar">
                                Bienvenido/a: ' . $_SESSION["NombreCliente"] . '
                            </div>
                        </div>
                    </div>
                </div>';
    }
}

function MostrarHeader()
{
    $cliente = "Invitado";
    if (isset($_SESSION["NombreCliente"])) {
        $cliente = $_SESSION["NombreCliente"];
    }

    echo '
        	<!-- Header -->
	<header>
		<!-- Header desktop -->
		<div class="container-menu-desktop">
			<!-- Topbar -->
			
			<div class="wrap-menu-desktop">
				<nav class="limiter-menu-desktop container">
					<!-- Logo desktop -->
					<a href="../Login/Home.php" class="logo">
						<img src="../images/logo-01.jpeg" alt="IMG-LOGO">
					</a>
					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">';

    if (isset($_SESSION["NombreCliente"])) {

        echo '
                                    <li>
                                        <a href="../Cliente/consultarPerfil.php">Mi Perfil</a>
                                    </li>

                                    <li>
                                        <a href="../Cliente/cambiarAcceso.php">Seguridad</a>
                                    </li>

                                    <li>
                                        <a href="../Soporte/crearSolicitud.php">Servicio al Cliente</a>
                                    </li>

                                    <li>
                                        <form action="" method="POST">
                                            <button type="submit" style="width:150px" id="btnCerrarSesion" name="btnCerrarSesion"
                                            class="btn btn-outline-primary mx-3 mt-2 d-block">Cerrar Sesión</button>
                                        </form>
                                    </li>';
    } else {
        echo '
                                    <li>
                                        <a href="../Login/inicioSesion.php" style="width:150px"
                                                    class="btn btn-outline-primary mx-3 mt-2 d-block">Iniciar Sesión</a>
                                    </li>';
    }

    echo '

						</ul>
					</div>

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m">

						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="1">
							<i class="zmdi zmdi-shopping-cart"></i>
						</div>

					</div>
				</nav>
			</div>
		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->
			<div class="logo-mobile">
			</div>

			<!-- Icon header -->
				<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart" data-notify="2">
					<i class="zmdi zmdi-shopping-cart"></i>
				</div>
		</div>
	</header>';
}

function ReferenciasCSS()
{
    echo '
            <head>
	            <meta charset="UTF-8">
	            <meta name="viewport" content="width=device-width, initial-scale=1">
                <meta charset="utf-8">
                <title>Tienda Ambiente</title>
                <link rel="shortcut icon" type="image/png" href="../images/logo-01.jpeg" />
                <link rel="stylesheet" href="../css/proyecto.css" />
                <link rel="stylesheet" href="../css/styles.min.css" />
                <link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.bootstrap5.css" />
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.14.5/dist/sweetalert2.min.css" />
                <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
                <link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css">
                <link rel="stylesheet" type="text/css" href="../css/material-design-iconic-font.min.css">
                <link rel="stylesheet" type="text/css" href="../css/icon-font.min.css">
                <link rel="stylesheet" type="text/css" href="../css/animate.css">
                <link rel="stylesheet" type="text/css" href="../css/hamburgers.min.css">
                <link rel="stylesheet" type="text/css" href="../css/animsition.min.css">
                <link rel="stylesheet" type="text/css" href="../css/select2.min.css">
                <link rel="stylesheet" type="text/css" href="../css/daterangepicker.css">
                <link rel="stylesheet" type="text/css" href="../css/slick.css">
                <link rel="stylesheet" type="text/css" href="../css/magnific-popup.css">
                <link rel="stylesheet" type="text/css" href="../css/perfect-scrollbar.css">
                <link rel="stylesheet" type="text/css" href="../css/util.css">
                <link rel="stylesheet" type="text/css" href="../css/main.css">
            </head>';
}

function ReferenciasJS()
{
    echo '
            <script src="../js/jquery.min.js"></script>
            <script src="../js/bootstrap.bundle.min.js"></script>
            <script src="../js/simplebar.js"></script>
            <script src="../js/sidebarmenu.js"></script>
            <script src="../js/app.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
            <script src="https://cdn.datatables.net/2.1.8/js/dataTables.js"></script>
            <script src="https://cdn.datatables.net/2.1.8/js/dataTables.bootstrap5.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.14.5/dist/sweetalert2.all.min.js"></script>
        ';
}
