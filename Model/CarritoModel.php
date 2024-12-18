<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Model/BaseDatos.php';

    function RegistrarCarritoModel($clienteID, $articuloID, $cantidad)
    {
        try
        {
            $enlace = AbrirBD();

            $sentencia = "CALL RegistrarCarrito('$clienteID', '$articuloID', '$cantidad')";
            $resultado = $enlace -> query($sentencia);

            CerrarBD($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return false;
        }
    }

    function ConsultarCarritoModel($clienteID)
    {
        try
        {
            $enlace = AbrirBD();

            $sentencia = "CALL ConsultarCarrito('$clienteID')";
            $resultado = $enlace -> query($sentencia);

            CerrarBD($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return null;
        }
    }

    function ConsultarResumenCarritoModel($clienteID)
    {
        try
        {
            $enlace = AbrirBD();

            $sentencia = "CALL ConsultarResumenCarrito('$clienteID')";
            $resultado = $enlace -> query($sentencia);

            CerrarBD($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return null;
        }
    }

    function RemoverArticuloCarritoModel($clienteID, $articuloID)
    {
        try
        {
            $enlace = AbrirBD();

            $sentencia = "CALL RemoverArticuloCarrito('$clienteID', '$articuloID')";
            $resultado = $enlace -> query($sentencia);

            CerrarBD($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return false;
        }
    }

    function PagarCarritoModel($clienteID)
    {
        try
        {
            $enlace = AbrirBD();

            $sentencia = "CALL PagarCarrito('$clienteID')";
            $resultado = $enlace -> query($sentencia);

            CerrarBD($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return false;
        }
    }

    function ConsultarFacturasModel($clienteID)
    {
        try
        {
            $enlace = AbrirBD();

            $sentencia = "CALL ConsultarFacturas('$clienteID')";
            $resultado = $enlace -> query($sentencia);

            CerrarBD($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return null;
        }
    }

    function ConsultarDetalleFacturaModel($id)
    {
        try
        {
            $enlace = AbrirBD();

            $sentencia = "CALL ConsultarDetalleFactura('$id')";
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
