<?php
    include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Model/LoginModel.php';

    if(session_status() == PHP_SESSION_NONE) {
        session_start();
    }

    if(isset($_POST["btnRegistrarCliente"]))
    {
        $cedula = $_POST["txtCedula"];
        $nombre = $_POST["txtNombre"];
        $apellido1 = $_POST["txtApellido1"];
        $apellido2 = $_POST["txtApellido2"];
        $contrasena = $_POST["txtContrasena"];
        $provinciaID = $_POST["txtProvinciaID"];
        $cantonID = $_POST["txtCantonID"];
        $distritoID = $_POST["txtDistritoID"];
        $otrasSenas = $_POST["txtOtrasSenas"];
        $codigoPostal = $_POST["txtCodigoPostal"];
        $telefono = $_POST["txtTelefono"];
        $correo = $_POST["txtCorreo"];
        

        $resultado = RegistrarClienteModel($cedula, $nombre, $apellido1, $apellido2, $contrasena, 
        $provinciaID, $cantonID, $distritoID, $otrasSenas, $codigoPostal, $correo, $telefono);

        if($resultado == true)
        {
            header('location: ../../View/Login/inicioSesion.php');
        }
        else
        {
            $_POST["txtMensaje"] = "Su información no se ha registrado correctamente";
        }
    }

    if(isset($_POST["btnIniciarSesion"]))
    {
        $correo = $_POST["txtCorreo"];
        $contrasenna = $_POST["txtContrasena"];

        $resultado = IniciarSesionModel($correo, $contrasena);

        if($resultado != null && $resultado -> num_rows > 0)
        {
            $datos = mysqli_fetch_array($resultado);
            $_SESSION["NombreCliente"] = $datos["nombre"];
            $_SESSION["ClienteID"] = $datos["clienteID"];
            $_SESSION["ClienteRolID"] = $datos["rolID"];

            header('location: ../../View/Login/home.php');
        }
        else
        {
            session_destroy();
            $_POST["txtMensaje"] = "Su información no se ha validado correctamente";
        }
    }

    if(isset($_POST["btnCerrarSesion"]))
    {
        session_destroy();
        header('location: ../../View/Login/home.php');
    }

    if(isset($_POST["btnRecuperarAcceso"]))
    {
        $correo = $_POST["txtCorreo"];

        $resultado = RecuperarAccesoModel($correo);

        if($resultado != null && $resultado -> num_rows > 0)
        {
            $datos = mysqli_fetch_array($resultado);
            $codigo = GenerarCodigo();

            ActualizarContrasennaModel($datos["clienteID"], $codigo);

            $contenido = "<html><body>
            Estimado(a) " . $datos["nombre"] . " " . $datos["apellido1"] . " " . $datos["apellido2"] . "<br/><br/>
            Se ha generado el siguiente código de seguridad: <b>" . $codigo . "</b><br/>
            Recuerde realizar el cambio de contraseña una vez que ingrese a nuestro sistrema<br/><br/>
            Muchas gracias.

            </body></html>";

            EnviarCorreo("Acceso al sistema", $contenido, $correo);

            header('location: ../../View/Login/inicioSesion.php');
        }
        else
        {
            $_POST["txtMensaje"] = "Su información no se ha validado correctamente";
        }
    }

        function GenerarCodigo() {
            $alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
            $pass = array();
            $alphaLength = strlen($alphabet) - 1;
            for ($i = 0; $i < 8; $i++) {
                $n = rand(0, $alphaLength);
                $pass[] = $alphabet[$n];
            }
            return implode($pass);
        }
    
        function EnviarCorreo($asunto,$contenido,$destinatario)
        {
            require 'PHPMailer/src/PHPMailer.php';
            require 'PHPMailer/src/SMTP.php';
    
            $correoSalida = "";
            $contrasennaSalida = "";
    
            $mail = new PHPMailer();
            $mail -> CharSet = 'UTF-8';
    
            $mail -> IsSMTP();
            $mail -> IsHTML(true); 
            $mail -> Host = 'smtp.office365.com';
            $mail -> SMTPSecure = 'tls';
            $mail -> Port = 587;                      
            $mail -> SMTPAuth = true;
            $mail -> Username = $correoSalida;               
            $mail -> Password = $contrasennaSalida;                                
            
            $mail -> SetFrom($correoSalida);
            $mail -> Subject = $asunto;
            $mail -> MsgHTML($contenido);   
            $mail -> AddAddress($destinatario);
    
            $mail -> send();
        }
    ?>