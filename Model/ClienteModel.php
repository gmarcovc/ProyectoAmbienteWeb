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
    function ActualizarPerfilModel($clienteID, $cedula, $nombre, $apellido1, $apellido2, $rolID, 
    $provinciaID, $cantonID, $distritoID, $otrasSenas, $codigoPostal, $correo, $telefono)
    {
        try
        {
            $enlace = AbrirBD();

            $sentencia = "CALL ActualizarPerfil('$clienteID', '$cedula', '$nombre', '$apellido1', '$apellido2', '$rolID', 
            '$provinciaID', '$cantonID', '$distritoID', '$otrasSenas', '$codigoPostal', '$correo', '$telefono')";
            $resultado = $enlace -> query($sentencia);

            CerrarBD($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            error_log($ex->getMessage());  // Log the error message
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

    function ConsultarProvinciasModel()
    {
        try {
            $enlace = AbrirBD();
            
            $sentencia = "CALL ConsultarProvincias()";
            $resultado = $enlace->query($sentencia);
            
            CerrarBD($enlace);
            return $resultado;
        } catch (Exception $ex) {
            return null;
        }
    }

    function ConsultarCantonesModel($provinciaID)
{
    try {
        $enlace = AbrirBD();
        
        $sentencia = "CALL ConsultarCantones($provinciaID)";
        $resultado = $enlace->query($sentencia);
        
        CerrarBD($enlace);
        return $resultado;
    } catch (Exception $ex) {
        return null;
    }
}

function ConsultarDistritosModel($provinciaID, $cantonID)
{
    try {
        $enlace = AbrirBD();
        
        $sentencia = "CALL ConsultarDistritos($provinciaID, $cantonID)";
        $resultado = $enlace->query($sentencia);
        
        CerrarBD($enlace);
        return $resultado;
    } catch (Exception $ex) {
        return null;
    }
}



    ?>