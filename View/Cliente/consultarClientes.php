<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/View/layout.php';
    include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Controller/ClienteController.php';
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

                    <div id="consultas" class="card">
                        <div class="card-body">

                            <h5 class="card-title">Consulta de Clientes</h5>
                            <div class="table-responsive">
                                <table id="example" class="table text-nowrap align-middle mb-0">
                                    <thead>
                                        <tr class="border-2 border-bottom border-primary border-0">
                                            <th scope="col">ID</th>
                                            <th scope="col">Cédula</th>
                                            <th scope="col">Nombre</th>
                                            <th scope="col">Apellido</th>
                                            <th scope="col">Apellido2</th>
                                            <th scope="col">Estado</th>
                                            <th scope="col">Rol</th>
                                            <th scope="col">Fecha Registro</th>
                                            <th scope="col">Provincia</th>
                                            <th scope="col">Otras Señas</th>
                                            <th scope="col">Código Postal</th>
                                            <th scope="col">Correo</th>
                                            <th scope="col">Teléfono</th>
                                            <th scope="col">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-group-divider">
                                       
                                        <?php
                                            $datos = ConsultarClientes();
                                            While($fila = mysqli_fetch_array($datos))
                                            {
                                                echo "<tr>";
                                                echo "<td>" . $fila["clienteID"] . "</td>";
                                                echo "<td>" . $fila["cedula"] . "</td>";
                                                echo "<td>" . $fila["nombre"] . "</td>";
                                                echo "<td>" . $fila["apellido1"] . "</td>";
                                                echo "<td>" . $fila["apellido2"] . "</td>";
                                                echo "<td>" . $fila["estadoID"] . "</td>";
                                                echo "<td>" . $fila["nombreRol"] . "</td>";
                                                echo "<td>" . $fila["fechaRegistro"] . "</td>";
                                                echo "<td>" . $fila["nombreProvincia"] . "</td>";
                                                echo "<td>" . $fila["otrasSenas"] . "</td>";
                                                echo "<td>" . $fila["codigoPostal"] . "</td>";
                                                echo "<td>" . $fila["correo"] . "</td>";
                                                echo "<td>" . $fila["telefono"] . "</td>";
                                                echo '<td>

                                                        <a href="actualizarCliente.php?id=' . $fila["clienteID"] . '" class="btn">
                                                            <i class="fa fa-edit" style="color:blue; font-size: 1.6em;"></i>
                                                        </a>

                                                        <button id="btnOpenModal" type="button" class="btn" data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                                                            data-id=' . $fila["clienteID"] . ' data-name="' . $fila["nombre"] . '">
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
    <script src="../js/ConsultarClientes.js"></script>

    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="width: 700px;">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Confirmación</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <form action="" method="POST">
                    <div class="modal-body">
                    
                        <input type="hidden" id="txtConsecutivo" name="txtConsecutivo">
                        ¿Desea cambiar el estado del usuario <label id="lblNombre"></label> ?

                    </div>
                    <div class="modal-footer">
                    <input type="submit" class="btn btn-primary" value="Procesar"
                        id="btnCambiarEstadoUsuario" name="btnCambiarEstadoUsuario">
                    </div>
                </form>
                
            </div>
        </div>
    </div>

</body>

</html>