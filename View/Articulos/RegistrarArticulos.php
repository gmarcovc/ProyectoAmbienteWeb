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

                    <div class="card">
                        <div class="card-body">

                            <h5 class="card-title fw-semibold mb-4">Registrar Artículo</h5>

                            <a href="ConsultarArticulos.php" class="btn btn-primary">
                                <i class="fa fa-plus" style="margin-right:5px;"></i>
                                Consultar Artículos
                            </a>

                            <br />
                            <br />

                            <?php
                                if(isset($_POST["txtMensaje"]))
                                {
                                    echo '<div class="alert alert-info Centrado">' . $_POST["txtMensaje"] . '</div>';
                                }
                            ?>

                                <form action="" method="POST" enctype="multipart/form-data">

                                <div class="mb-3">
                                    <label class="form-label">Nombre</label>
                                    <input type="text" class="form-control" required id="txtNombre" name="txtNombre">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Precio</label>
                                    <input type="text" class="form-control" required id="txtPrecio" name="txtPrecio"
                                    maxlength="8" onkeypress="return SoloNumeros(event)">
                                </div>

                                <div class="mb-4">
                                    <label class="form-label">Cantidad</label>
                                    <input type="text" class="form-control" required id="txtCantidad" name="txtCantidad"
                                    maxlength="3" onkeypress="return SoloNumeros(event)">
                                </div>

                                <div class="mb-4">
                                    <label class="form-label">Imagen</label>
                                    <input type="file" class="form-control" required id="txtImagen" name="txtImagen"
                                    accept="image/png, image/jpg, image/jpeg">
                                </div>

                                <div class="mb-4">
                                    <label class="form-label">Categoría</label>
                                    <select id="ddlCategorias" name="ddlCategorias" class="form-control" required>
                                        <?php
                                            $categorias = ConsultarCategorias();
                                            echo "<option value=''> Seleccione </option>";
                                            while($fila = mysqli_fetch_array($categorias)) 
                                            {
                                                if($fila["categoriaID"] == $datos["categoriaID"]) 
                                                {
                                                    echo "<option selected value=" . $fila["categoriaID"] . ">" . $fila["nombre"] . "</option>";
                                                } 
                                                else 
                                                {
                                                    echo "<option value=" . $fila["categoriaID"] . ">" . $fila["nombre"] . "</option>";
                                                }
                                            }
                                        ?>
                                    </select>
                                </div>

                                <input type="submit" class="btn btn-primary" value="Procesar" id="btnRegistrarArticulo"
                                    name="btnRegistrarArticulo">

                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    
    <?php
        ReferenciasJS();
    ?>
    <script src="../js/Comunes.js"></script>

</body>

</html>