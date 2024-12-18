<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/View/layout.php';
    include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Controller/ArticulosController.php';
    include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Controller/CarritoController.php';
?>

<!DOCTYPE html>
<html lang="en">

<?php
    ReferenciasCSS();
?>

<body class="animsition">

	<?php
        MostrarMenu();
    ?>

	<?php
        MostrarHeader();
    ?>

<!-- ARTICULOS -->
<section class="bg0 p-t-23 p-b-140">
    <div class="container">
        <div class="p-b-10">
            <h3 class="ltext-103 cl5" style="text-align: center;">
			<br/><br/>
                NUESTROS ARTÍCULOS
            </h3>
        </div>

		<br/><br/>

        <div class="row"> 
            <?php
                $articulos = ConsultarArticulos();
                while ($fila = mysqli_fetch_array($articulos)) {
                    echo '
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="card">
                            <div style="text-align:center">
                                <img class="card-img-top" src="' . $fila["imagen"] . '" style="width:175px; height:150px; margin-top:20px">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">' . $fila["nombre"] . '</h5>
                                
                                Unidades: ' . $fila["cantidad"] . ' <br/>
                                Precio: ¢ ' . number_format($fila["precio"], 2) . '

                                <br/>';

                                if (isset($_SESSION["NombreCliente"])) {
                                    if ($fila["cantidad"] > 0) {
                                        echo '
                                        <div class="row">
                                            <div class="col-6">
                                                <input id="' . $fila["articuloID"] . '" type="number" class="form-control" style="text-align:center" 
                                                onkeypress="return false;" value="0" min="1" max="' . $fila["cantidad"] . '">
                                            </div>
                                            <div class="col-6">
                                                <a onclick="RegistrarCarritoJS(' . $fila["articuloID"] . ', ' . $fila["cantidad"] . ');" style="width:100%" class="btn btn-primary">+ Añadir</a>
                                            </div>
                                        </div>';
                                    } else {
                                        echo '
                                        <div class="row">
                                            <div class="col-12 text-center">
                                                <p style="color:red; font-weight:bold;">AGOTADO</p>
                                            </div>
                                        </div>';
                                    }
                                }

                                echo '</div>
                        </div>
                    </div>';
                }
            ?>
        </div>
    </div>
</section> 

	<!-- Footer -->
	<footer class="bg3 p-t-75 p-b-32">
    <div class="container">
                <h4 class="stext-301 cl0 p-b-30">
                    Grupo 4
                </h4>
                    <p>Vasquez Carrillo Gian Marco - Bustos Araya Amber Natasha - Rodriguez Perez Joshua Andrey - Aguilar Villalobos Erick Esteban - Madrigal Vega Kevin Joel</p>
            </div>
        </div>
    </div>
</footer>


	<!--===============================================================================================-->
	<script src="../js/jquery-3.2.1.min.js"></script>
	<script src="../js/animsition.min.js"></script>
	<script src="../js/popper.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/select2.min.js"></script>
	<script src="../js/moment.min.js"></script>
	<script src="../js/daterangepicker.js"></script>
	<script src="../js/slick.min.js"></script>
	<script src="../js/slick-custom.js"></script>
	<script src="../js/parallax100.js"></script>
	<script src="../js/jquery.magnific-popup.min.js"></script>
	<script src="../js/isotope.pkgd.min.js"></script>
	<script src="../js/sweetalert.min.js"></script>
	<script src="../js/perfect-scrollbar.min.js"></script>
	<script src="../js/main.js"></script>

	<script src="../js/Comunes.js"></script>
    <script src="../js/RegistrarCarrito.js"></script>

</body>

</html>
