<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Model/BaseDatos.php';

    function ConsultarClienteModel($clienteID)
    {
        try
        {
            $enlace = AbrirBD();

            $sentencia = "CALL ConsultarCliente('$clienteID')";
            $resultado = $enlace -> query($sentencia);

            CerrarBD($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return null;
        }
    }
 
    #********************Hace falta vista********************
    function ConsultarClientesModel($clienteID)
    {
        try
        {
            $enlace = AbrirBD();

            $sentencia = "CALL ConsultarClientes('$clienteID')";
            $resultado = $enlace -> query($sentencia);

            CerrarBD($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return null;
        }
    }
    #********************Hace falta vista********************
    function ActualizarPerfilModel($clienteID, $cedula, $nombre, $apellido1, $apellido2, 
    $provinciaID, $cantonID, $distritoID, $otrasSenas, $codigoPostal, $correo, $telefono)
    {
        try
        {
            $enlace = AbrirBD();

            $sentencia = "CALL ActualizarPerfil('$clienteID', '$cedula', '$nombre', '$apellido1', '$apellido2', 
            '$provinciaID', '$cantonID', '$distritoID', '$otrasSenas', '$codigoPostal', '$correo', '$telefono')";
            $resultado = $enlace -> query($sentencia);

            CerrarBD($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return false;
        }
    }

    #********************Hace falta vista y PA********************
    function CambiarEstadoClienteModel($clienteID)
    {
        try
        {
            $enlace = AbrirBD();

            $sentencia = "CALL CambiarEstadoCliente('$clienteID')";
            $resultado = $enlace -> query($sentencia);

            CerrarBD($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return false;
        }
    }

    #********************Hace falta vista y PA********************
    function ConsultarRolesModel()
    {
        try
        {
            $enlace = AbrirBD();

            $sentencia = "CALL ConsultarRoles()";
            $resultado = $enlace -> query($sentencia);

            CerrarBD($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return null;
        }
    }

    ?>