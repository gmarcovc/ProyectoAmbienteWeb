<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Model/LoginModel.php';
    include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Model/ClienteModel.php';

    if(session_status() == PHP_SESSION_NONE) {
        session_start();
    }

    #********************Hace falta vista, modelo y PA********************
    if(isset($_POST["btnActualizarAcceso"]))
    {
        $contrasenaActual = $_POST["txtContrasenaActual"];
        $contrasenaNueva = $_POST["txtContrasenaNueva"];
        $contrasenaConfirmar = $_POST["txtContrasenaConfirmar"];

        if($contrasenaActual == $contrasenaNueva)
        {
            $_POST["txtMensaje"] = "Debe ingresar una contraseña nueva";
        }
        else if($contrasenaNueva != $contrasenaConfirmar)
        {
            $_POST["txtMensaje"] = "Las nuevas contraseñas no coinciden";
        }
        else
        {
            $resultado = ActualizarContrasenaModel($_SESSION["ClienteID"], $contrasenaNueva);
        
            if($resultado == true)
            {
                header('location: ../../View/Login/home.php');
            }
            else
            {
                $_POST["txtMensaje"] = "Su contraseña no se ha actualizado correctamente";
            }
        }
    }

    function ConsultarCliente($clienteID)
    {
        $resultado = ConsultarClienteModel($clienteID);

        if($resultado != null && $resultado -> num_rows > 0)
        {
            return mysqli_fetch_array($resultado);
        }
        else
        {
            $_POST["txtMensaje"] = "Su información no se ha obtenido correctamente";
            #header('location: ../../View/Login/home.php');
        }

    }

    #********************Hace falta vista********************
    function ConsultarClientes()
    {
        return ConsultarClientesModel($_SESSION["ClienteID"]);
    }

    #********************Hace falta vista********************
    if(isset($_POST["btnActualizarPerfil"]))
    {

        $cedula = $_POST["txtCedula"];
        $nombre = $_POST["txtNombre"];
        $apellido1 = $_POST["txtApellido1"]; 
        $apellido2 = $_POST["txtApellido2"]; 
        $rolID = $_POST["txtRol"];
        $provinciaID = $_POST["ddlProvincias"]; 
        $cantonID = $_POST["ddlCantones"];
        $distritoID = $_POST["ddlDistritos"]; 
        $otrasSenas = $_POST["txtOtrasSenas"];
        $codigoPostal = $_POST["txtCodigoPostal"]; 
        $correo = $_POST["txtCorreo"];
        $telefono = $_POST["txtTelefono"];

        $resultado = ActualizarPerfilModel($_SESSION["ClienteID"],$cedula,$nombre,$apellido1,$apellido2,$rolID,
        $provinciaID,$otrasSenas,$codigoPostal,$correo,$telefono);
        
        if($resultado == true)
        {
            $_SESSION["NombreCliente"] = $nombre;
            header('location: ../../View/Login/home.php');
        }
        else
        {
            $_POST["txtMensaje"] = "Su información no se ha actualizado correctamente";
        }
    }

        if(isset($_POST["btnActualizarCliente"]))
        {
            $clienteID = $_POST["txtClienteID"];
            $cedula = $_POST["txtCedula"];
            $nombre = $_POST["txtNombre"];
            $apellido1 = $_POST["txtApellido1"]; 
            $apellido2 = $_POST["txtApellido2"]; 
            $rolID = $_POST["ddlRoles"];
            $provinciaID = $_POST["ddlProvincias"]; 
            $otrasSenas = $_POST["txtOtrasSenas"];
            $codigoPostal = $_POST["txtCodigoPostal"]; 
            $correo = $_POST["txtCorreo"];
            $telefono = $_POST["txtTelefono"];
    
            $resultado = ActualizarPerfilModel($clienteID, $cedula, $nombre, $apellido1, $apellido2, $rolID, 
            $provinciaID, $otrasSenas, $codigoPostal, $correo, $telefono);
            
            if($resultado == true)
            {
                header('location: ../../View/Cliente/consultarClientes.php');
            }
            else
            {
                $_POST["txtMensaje"] = "No fue posible actualizar la información del cliente";
            }
        }

        #********************Hace falta vista, modelo y PA********************
        if(isset($_POST["btnCambiarEstadoCliente"]))
        {
            $clienteID = $_POST["txtClienteID"];
    
            $resultado = CambiarEstadoClienteModel($clienteID);
            
            if($resultado == true)
            {
                header('location: ../../View/Cliente/consultarClientes.php');
            }
            else
            {
                $_POST["txtMensaje"] = "No fue posible actualizar el estado del usuario";
            }
        }

        function ConsultarRoles()
        {
            $resultado = ConsultarRolesModel();
    
            if($resultado != null && $resultado -> num_rows > 0)
            {
                return $resultado;
            }
        }

        function ConsultarProvincias()
        {
            $resultado = ConsultarProvinciasModel();
            
            if ($resultado != null && $resultado->num_rows > 0) {
                return $resultado;
            }
        }

        function ConsultarCantones($provinciaID)
        {
            $resultado = ConsultarCantonesModel($provinciaID);
            
            if ($resultado != null && $resultado->num_rows > 0) {
                return $resultado;
            }
        }

        function ConsultarDistritos($provinciaID, $cantonID)
        {
            $resultado = ConsultarDistritosModel($provinciaID, $cantonID);
            
            if ($resultado != null && $resultado->num_rows > 0) {
                return $resultado;
            }
        }
    
    ?>