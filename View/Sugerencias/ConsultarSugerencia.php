<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/View/layout.php';
    include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Controller/SugerenciaController.php';
?>

<!doctype html>
<html lang="en">

<?php
    ReferenciasCSS();
?>

<body class="page-wrapper radial-gradient">
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

                    <div id="sugerencias" class="card">
                        <div class="card-body">

                            <h5 class="card-title fw-semibold mb-4">Consulta de Sugerencias</h5>
                            <div class="table-responsive">
                                <table id="example" class="table text-nowrap align-middle mb-0">
                                    <thead>
                                        <tr class="border-2 border-bottom border-primary border-0">
                                            <th scope="col">ID</th>
                                            <th scope="col">Descripción</th>
                                            <th scope="col">ID Cliente</th>
                                            <th scope="col">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-group-divider">
                                       
                                        <?php
                                            $datos = ConsultarSugerencias();
                                            if ($datos != null)
                                            {
                                                while($fila = mysqli_fetch_array($datos))
                                                {
                                                    echo "<tr>";
                                                    echo "<td>" . $fila["sugerenciaID"] . "</td>";
                                                    echo "<td>" . $fila["descripcion"] . "</td>";
                                                    echo "<td>" . $fila["clienteID"] . "</td>";
                                                    echo '<td>
                                                            <a href="verSugerencia.php?id=' . $fila["sugerenciaID"] . '" class="btn">
                                                                <i class="fa fa-eye" style="color:green; font-size: 1.6em;"></i>
                                                            </a>
                                                          </td>';
                                                    echo "</tr>";   
                                                }
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

</body>

</html>
