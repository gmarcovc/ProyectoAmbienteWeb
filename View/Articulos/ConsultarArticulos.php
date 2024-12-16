<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/View/layout.php';
    include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Controller/ArticulosController.php';
?>

<!doctype html>
<html lang="en">

<?php
    ReferenciasCSS();
?>

<body class="page-wrapper">
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed">

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

                            <h5 class="card-title fw-semibold mb-4">Consulta de Artículos</h5>

                            <br />

                            <a href="RegistrarArticulos.php" class="btn btn-primary">
                                <i class="fa fa-plus" style="margin-right:5px;"></i>
                                Registrar Artículo
                            </a>

                            <br />
                            <br />

                            <div class="table-responsive">
                                <table id="example" class="table text-nowrap align-middle mb-0">
                                    <thead>
                                        <tr class="border-2 border-bottom border-primary border-0">
                                            <th scope="col">#</th>
                                            <th scope="col">Nombre</th>
                                            <th scope="col">Precio</th>
                                            <th scope="col">Cantidad</th>
                                            <th scope="col">Imagen</th>
                                            <th scope="col">Categoría</th>
                                            <th scope="col">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-group-divider">

                                        <?php
                                            $datos = ConsultarArticulos();
                                            While($fila = mysqli_fetch_array($datos))
                                            {
                                                echo "<tr>";
                                                echo "<td>" . $fila["articuloID"] . "</td>";
                                                echo "<td>" . $fila["nombre"] . "</td>";
                                                echo "<td>₡ " . number_format($fila["precio"],2) . "</td>";
                                                echo "<td>" . $fila["cantidad"] . "</td>";

                                                echo "<td><img width='125' height='100' src='" . $fila["imagen"] . "' alt='Imagen'></img></td>";
                                                echo "<td>" . $fila["nombreCategoria"] . "</td>";
                                                echo '<td>

                                                        <a href="ActualizarArticulo.php?id=' . $fila["articuloID"] . '" class="btn">
                                                            <i class="fa fa-edit" style="color:blue; font-size: 1.6em;"></i>
                                                        </a>

                                                        <button id="btnOpenModal" type="button" class="btn" data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                                                            data-id=' . $fila["articuloID"] . ' data-name="' . $fila["nombre"] . '">
                                                            <i class="fa fa-trash" style="color:red; font-size: 1.6em;"></i>
                                                        </button>

                                                      </td>';
                                                echo "</tr>";   
                                            }
                                        ?>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <?php
        ReferenciasJS();
    ?>
    <script src="../js/ConsultarArticulos.js"></script>

    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="width: 700px;">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Confirmación</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <form action="" method="POST">
                <div class="modal-body">
                    <input type="hidden" id="txtArticuloID" name="txtArticuloID">
                    ¿Desea eliminar el artículo:<label id="lblNombre"></label>?
                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-primary" value="Procesar"
                        id="btnEliminarArticulo" name="btnEliminarArticulo">
                </div>
            </form>
        </div>
    </div>
</div>

</body>

</html>
