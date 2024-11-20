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

    ?>