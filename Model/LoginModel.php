<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/Model/BaseDatos.php';

    function RegistrarClienteModel($cedula, $nombre, $apellido1, $apellido2, $contrasena, $estadoID, $rolID, $provinciaID, $cantonID, $distritoID, $otrasSenas, $codigoPostal, $correo, $telefono) 
    {
        try 
        {
            $enlace = AbrirBD();
    
            $sentencia = "CALL RegistrarCliente('$cedula', '$nombre', '$apellido1', '$apellido2', '$contrasena', $estadoID, $rolID, $provinciaID, $cantonID, $distritoID, '$otrasSenas', '$codigoPostal', '$correo', '$telefono')";
            $resultado = $enlace->query($sentencia);
    
            CerrarBD($enlace);
            return $resultado;
        } 
        catch (Exception $ex) 
        {
            return false;
        }
    }

    function IniciarSesionModel($correo, $contrasena)
    {
        try
        {
            $enlace = AbrirBD();

            $sentencia = "CALL IniciarSesion('$correo','$contrasena')";
            $resultado = $enlace -> query($sentencia);

            CerrarBD($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return null;
        }
    }

    function RecuperarAccesoModel($correo)
    {
        try
        {
            $enlace = AbrirBD();

            $sentencia = "CALL RecuperarAcceso('$correo')";
            $resultado = $enlace -> query($sentencia);

            CerrarBD($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return null;
        }
    }

    function ActualizarContrasennaModel($Consecutivo, $Codigo)
    {
        try
        {
            $enlace = AbrirBD();

            $sentencia = "CALL ActualizarContrasenna('$Consecutivo','$Codigo')";
            $resultado = $enlace -> query($sentencia);

            CerrarBD($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return false;
        }
    }

?>