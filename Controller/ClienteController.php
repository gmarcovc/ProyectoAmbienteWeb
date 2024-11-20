<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/Model/LoginModel.php';
    include_once $_SERVER["DOCUMENT_ROOT"] . '/Model/ClienteModel.php';

    if(session_status() == PHP_SESSION_NONE) {
        session_start();
    }


    #********************Hace falta vista********************
    function ConsultarCliente($clienteID)
    {
        $resultado = ConsultarUsuarioModel($clienteID);

        if($resultado != null && $resultado -> num_rows > 0)
        {
            return mysqli_fetch_array($resultado);
        }
        else
        {
            $_POST["txtMensaje"] = "Su información no se ha obtenido correctamente";
            header('location: ../../View/Login/home.php');
        }

    }
    #********************Hace falta vista********************
    if(isset($_POST["btnActualizarPerfil"]))
    {

        $cedula = $_POST["txtCedula"];
        $nombre = $_POST["txtNombre"];
        $apellido1 = $_POST["txtApellido1"]; 
        $apellido2 = $_POST["txtApellido2"]; 
        $provinciaID = $_POST["txtProvinciaID"]; 
        $cantonID = $_POST["txtCantonID"];
        $distritoID = $_POST["txtDistritoID"]; 
        $otrasSenas = $_POST["txtOtrasSenas"];
        $codigoPostal = $_POST["txtCodigoPostal"]; 
        $correo = $_POST["txtCorreo"];
        $telefono = $_POST["txtTelefono"];

        $resultado = ActualizarPerfilModel($_SESSION["ConsecutivoUsuario"],$identificacion,$nombre,$correo,0);
        
        if($resultado == true)
        {
            $_SESSION["NombreUsuario"] = $nombre;
            header('location: ../../View/Login/home.php');
        }
        else
        {
            $_POST["txtMensaje"] = "Su información no se ha actualizado correctamente";
        }
    }

    
    #********************Hace falta vista, modelo y PA********************
    if(isset($_POST["btnActualizarAcceso"]))
    {
        $contrasenaActual = $_POST["txtContrasenaActual"];
        $contrasenaNueva = $_POST["txtContrasenaNueva"];
        $contrasenaConfirmar = $_POST["txtContrasenaConfirmar"];

        if($contrasennaActual == $contrasenaNueva)
        {
            $_POST["txtMensaje"] = "Debe ingresar una contraseña nueva";
        }
        else if($contrasennaNueva != $contrasenaConfirmar)
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

    #********************Hace falta vista y PA********************
    function ConsultarClientes()
    {
        $resultado = ConsultarClientesModel($_SESSION["ClienteID"]);

        if($resultado != null && $resultado -> num_rows > 0)
        {
            return $resultado;
        }
    }

    #********************Hace falta vista, modelo y PA********************
        if(isset($_POST["btnActualizarCliente"]))
        {
            $clienteID = $_POST["txtClienteID"];
            $cedula = $_POST["txtCedula"];
            $nombre = $_POST["txtNombre"];
            $apellido1 = $_POST["txtApellido1"]; 
            $apellido2 = $_POST["txtApellido2"]; 
            $rolID = $_POST["txtRolID"];
            $provinciaID = $_POST["txtProvinciaID"]; 
            $cantonID = $_POST["txtCantonID"];
            $distritoID = $_POST["txtDistritoID"]; 
            $otrasSenas = $_POST["txtOtrasSenas"];
            $codigoPostal = $_POST["txtCodigoPostal"]; 
            $correo = $_POST["txtCorreo"];
            $telefono = $_POST["txtTelefono"];
    
            $resultado = ActualizarPerfilModel($clienteID, $cedula, $nombre, $apellido1, $apellido2, $rolID, 
            $provinciaID, $cantonID, $distritoID, $otrasSenas, $codigoPostal, $correo, $telefono);
            
            if($resultado == true)
            {
                header('location: ../../View/Cliente/consultarClientes.php');
            }
            else
            {
                $_POST["txtMensaje"] = "No fue posible actualizar la información del usuario";
            }
        }

        #********************Hace falta vista, modelo y PA********************
        if(isset($_POST["btnCambiarEstadoCliente"]))
        {
            $clienteID = $_POST["txtClienteID"];
    
            $resultado = CambiarEstadoUsuarioModel($clienteID);
            
            if($resultado == true)
            {
                header('location: ../../View/Cliente/consultarClientes.php');
            }
            else
            {
                $_POST["txtMensaje"] = "No fue posible actualizar el estado del usuario";
            }
        }

        #********************Hace falta vista, modelo y PA********************
        function ConsultarRoles()
        {
            $resultado = ConsultarRolesModel();
    
            if($resultado != null && $resultado -> num_rows > 0)
            {
                return $resultado;
            }
        }
    
    ?>