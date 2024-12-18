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
                            <?php
                            if (isset($_SESSION['mensaje'])) {
                                echo '<div class="alert alert-info text-center">' . $_SESSION['mensaje'] . '</div>';
                                unset($_SESSION['mensaje']);
                            }
                            ?>
                            <div class="table-responsive">
                                <table id="example" class="table text-nowrap align-middle mb-0">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Comentario</th>
                                            <th scope="col">Nombre del Cliente</th>
                                            <th scope="col">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        if ($resultado && $resultado->num_rows > 0) {
                                            while ($fila = $resultado->fetch_assoc()) {
                                                $nombreCliente = isset($fila['nombreCliente']) ? $fila['nombreCliente'] : 'Anónimo';
                                                echo "<tr>";
                                                echo "<td>{$fila['consultaID']}</td>";
                                                echo "<td>{$fila['descripcion']}</td>";
                                                echo "<td>{$nombreCliente}</td>";
                                                echo "<td>
                                                    <form action='' method='POST' onsubmit='return confirmarEliminacion()'>
                                                        <input type='hidden' name='eliminarID' value='{$fila['consultaID']}'>
                                                        <button type='submit' class='btn btn-danger'>Eliminar</button>
                                                    </form>
                                                </td>";
                                                echo "</tr>";
                                            }
                                        } else {
                                            echo "<tr><td colspan='4'>No se encontraron sugerencias.</td></tr>";
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

    <script>
        function confirmarEliminacion() {
            return confirm("¿Seguro que deseas borrar la sugerencia?");
        }
    </script>
</body>
</html>
