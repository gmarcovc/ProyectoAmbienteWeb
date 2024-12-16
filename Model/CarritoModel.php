<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/Model/BaseDatos.php';

    function RegistrarCarritoModel($ClienteID, $ArticuloID, $cantidad)
    {
        try
        {
            $enlace = AbrirBD();

            $sentencia = "CALL RegistrarCarrito('$ClienteID', '$ArticuloID', '$cantidad')";
            $resultado = $enlace -> query($sentencia);

            CerrarBD($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return false;
        }
    }

    function ConsultarCarritoModel($ClienteID)
    {
        try
        {
            $enlace = AbrirBD();

            $sentencia = "CALL ConsultarCarrito('$ClienteID')";
            $resultado = $enlace -> query($sentencia);

            CerrarBD($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return null;
        }
    }

    function ConsultarResumenCarritoModel($ClienteID)
    {
        try
        {
            $enlace = AbrirBD();

            $sentencia = "CALL ConsultarResumenCarrito('$ClienteID')";
            $resultado = $enlace -> query($sentencia);

            CerrarBD($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return null;
        }
    }

    function RemoverProductoCarritoModel($ClienteID, $ArticuloID)
    {
        try
        {
            $enlace = AbrirBD();

            $sentencia = "CALL RemoverProductoCarrito('$ClienteID', '$ArticuloID')";
            $resultado = $enlace -> query($sentencia);

            CerrarBD($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return false;
        }
    }

    function PagarCarritoModel($ClienteID)
    {
        try
        {
            $enlace = AbrirBD();

            $sentencia = "CALL PagarCarrito('$ClienteID')";
            $resultado = $enlace -> query($sentencia);

            CerrarBD($enlace);
            return $resultado;
        }
        catch(Exception $ex)
        {
            return false;
        }
    }

    function ConsultarFacturasModel($ClienteID)
    {
        try
        {
            $enlace = AbrirBD();

            $sentencia = "CALL ConsultarFacturas('$ClienteID')";
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
