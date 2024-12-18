<?php
session_start(); 
include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/View/layout.php';
include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Controller/SugerenciaController.php';

$resultado = ConsultarSugerencias();
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
                    <div id="sugerencias" class="card">
                        <div class="card-body">
                            <h5 class="card-title fw-semibold mb-4">Consulta de Sugerencias</h5>
                            <div class="table-responsive">
                                <table id="example" class="table text-nowrap align-middle mb-0">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Descripción</th>
                                            <th scope="col">ID Cliente</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        if ($resultado) {
                                            while ($fila = $resultado->fetch_assoc()) {
                                                echo "<tr>";
                                                echo "<td>{$fila['consultaID']}</td>";
                                                echo "<td>{$fila['descripcion']}</td>";
                                                echo "<td>{$fila['clienteID']}</td>";
                                                echo "</tr>";
                                            }
                                        } else {
                                            echo "<tr><td colspan='3'>No se encontraron sugerencias.</td></tr>";
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
    <?php ReferenciasJS(); ?>
</body>
</html>
