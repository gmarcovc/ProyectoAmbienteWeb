<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/View/layout.php';
    include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Controller/ClienteController.php';
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
                    <div class="col-12">
                        <!-- Programar el resto de aquí para abajo -->
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
