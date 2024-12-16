<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/View/layout.php';
    include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Controller/ProductoController.php';
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

	<!-- Cart -->
	<div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>

		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2">
					Su carrito 
				</span>

				<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>

			<div class="header-cart-content flex-w js-pscroll">
				<ul class="header-cart-wrapitem w-full">
					<!-- Aquí irían los productos dinámicos del carrito -->
				</ul>

				<div class="w-full">
					<div class="header-cart-total w-full p-tb-40">
						Total: $<!-- Total dinámico de los productos del carrito -->
					</div>

					<div class="header-cart-buttons flex-w w-full">
						<a href="shoping-cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
							Ver Carrito
						</a>

						<a href="shoping-cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
							Pagar
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Slider -->
	<section class="section-slide">
		<div class="wrap-slick1">
			<div class="slick1">
				<!-- Aquí irían las imágenes dinámicas del slider -->
				<div class="item-slick1" style="background-image: url(../images/slide-01.jpg);">
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false" data-appear="fadeInDown" data-delay="0">
								<span class="ltext-101 cl2 respon2">
									Colección de mujer 2025
								</span>
							</div>

							<div class="layer-slick1 animated visible-false" data-appear="fadeInUp" data-delay="800">
								<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">
									Nueva Temporada
								</h2>
							</div>
						</div>
					</div>
				</div>

				<div class="item-slick1" style="background-image: url(../images/slide-02.jpg);">
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false" data-appear="rollIn" data-delay="0">
								<span class="ltext-101 cl2 respon2">
									Nueva Temporada 2025
								</span>
							</div>

							<div class="layer-slick1 animated visible-false" data-appear="lightSpeedIn" data-delay="800">
								<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">
									Jackets
								</h2>
							</div>
						</div>
					</div>
				</div>

				<div class="item-slick1" style="background-image: url(../images/slide-03.jpg);">
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false" data-appear="rotateInDownLeft" data-delay="0">
								<span class="ltext-101 cl2 respon2">
									Colección de hombre 2025
								</span>
							</div>

							<div class="layer-slick1 animated visible-false" data-appear="rotateInUpRight" data-delay="800">
								<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">
									Nuevos Productos
								</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

<!-- ARTICULOS -->
<section class="bg0 p-t-23 p-b-140">
    <div class="container">
        <div class="p-b-10">
            <h3 class="ltext-103 cl5" style="text-align: center;">
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
