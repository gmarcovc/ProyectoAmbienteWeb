-- Crear la base de datos
CREATE DATABASE TiendaAmbienteProyectoWebb;

-- Usar la base de datos creada
USE TiendaAmbienteProyectoWebb;

-- Borrar la base de datos
-- DROP DATABASE TiendaAmbienteProyectoWebb;

CREATE TABLE Roles (
    rolID INT PRIMARY KEY AUTO_INCREMENT,
    nombreRol VARCHAR(25) NOT NULL
);

CREATE TABLE Estados (
    estadoID INT PRIMARY KEY AUTO_INCREMENT,
    nombreEstado VARCHAR(25) NOT NULL
);

CREATE TABLE Provincias (
	provinciaID INT PRIMARY KEY AUTO_INCREMENT,
	provincia VARCHAR(50) NOT NULL
);

CREATE TABLE Cantones (
    cantonID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    canton VARCHAR(50) NOT NULL,
    provinciaID INT NOT NULL,
    FOREIGN KEY (provinciaID) REFERENCES Provincias(provinciaID) ON DELETE CASCADE
);

CREATE TABLE Distritos (
    distritoID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    distrito VARCHAR(50) NOT NULL,
    cantonID INT NOT NULL,
    provinciaID INT NOT NULL,
    FOREIGN KEY (cantonID) REFERENCES Cantones(cantonID) ON DELETE NO ACTION,
    FOREIGN KEY (provinciaID) REFERENCES Provincias(provinciaID) ON DELETE NO ACTION
);

CREATE TABLE Clientes (
    clienteID INT PRIMARY KEY AUTO_INCREMENT,
    cedula VARCHAR(9) NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NOT NULL,
    contrasena VARCHAR(20) NOT NULL,
	estadoID INT NOT NULL,
    rolID INT NOT NULL,
    fechaRegistro DATETIME NOT NULL,
    provinciaID INT NOT NULL, 
    cantonID INT NOT NULL, 
    distritoID INT NOT NULL, 
    otrasSenas VARCHAR(200) NOT NULL, 
    codigoPostal VARCHAR(10),
    correo VARCHAR(50) NOT NULL UNIQUE, 
    telefono VARCHAR(15) NOT NULL UNIQUE, 
    FOREIGN KEY (estadoID) REFERENCES Estados(estadoID) ON DELETE CASCADE,
    FOREIGN KEY (rolID) REFERENCES Roles(rolID) ON DELETE CASCADE,
    FOREIGN KEY (distritoID) REFERENCES Distritos(distritoID) ON DELETE NO ACTION,
    FOREIGN KEY (cantonID) REFERENCES Cantones(cantonID) ON DELETE NO ACTION,
    FOREIGN KEY (provinciaID) REFERENCES Provincias(provinciaID) ON DELETE NO ACTION
);

CREATE TABLE Categorias (
    categoriaID INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Productos (
    productoID INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(500),
    precio DECIMAL(18,3) NOT NULL,
    categoriaID INT NOT NULL,
    stock INT NOT NULL,
    estadoID INT NOT NULL,
    FOREIGN KEY (categoriaID) REFERENCES Categorias(categoriaID),
    FOREIGN KEY (estadoID) REFERENCES Estados(estadoID)
);

CREATE TABLE MetodosPago (
    metodoPagoID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Pedidos (
    pedidoID INT PRIMARY KEY AUTO_INCREMENT,
    clienteID INT NOT NULL,
    fechaPedido DATETIME NOT NULL,
    metodoPagoID INT NOT NULL,
    estadoID INT NOT NULL,
    FOREIGN KEY (clienteID) REFERENCES Clientes(clienteID),
    FOREIGN KEY (estadoID) REFERENCES Estados(estadoID),
    FOREIGN KEY (metodoPagoID) REFERENCES MetodosPago(metodoPagoID)
);

-- Tabla de Detalles de Pedido
CREATE TABLE DetallesPedido (
    detallePedidoID INT PRIMARY KEY AUTO_INCREMENT,
    pedidoID INT NOT NULL,
    productoID INT NOT NULL,
    cantidad INT NOT NULL,
    precioUnitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (pedidoID) REFERENCES Pedidos(pedidoID),
    FOREIGN KEY (productoID) REFERENCES Productos(productoID)
);

INSERT INTO Roles (nombreRol)
VALUES 
('Admin'),
('Cliente');

INSERT INTO Estados (nombreEstado)
VALUES 
('Activo'),
('Inactivo'),
('En proceso'),
('Enviado'),
('Cancelado');

INSERT INTO Provincias (provinciaID, provincia) VALUES 
(1, 'San José'),
(2, 'Alajuela'),
(3, 'Cartago'),
(4, 'Heredia'),
(5, 'Guanacaste'),
(6, 'Puntarenas'),
(7, 'Limón');

INSERT INTO Cantones (cantonID, canton, provinciaID) VALUES 
(1, 'San José', 1),
(2, 'Escazú', 1),
(3, 'Desamparados', 1),
(4, 'La Unión', 1),
(5, 'Curridabat', 1),
(6, 'Pérez Zeledón', 1),
(7, 'Turrubares', 1),
(8, 'Mora', 1),
(9, 'Dota', 1),
(10, 'Tibás', 1),
(11, 'Montes de Oca', 1),
(12, 'Alajuelita', 1),
(13, 'Vázquez de Coronado', 1),
(14, 'San Ramón', 1),
(15, 'Alajuela', 2),
(16, 'San Carlos', 2),
(17, 'Grecia', 2),
(18, 'Atenas', 2),
(19, 'Naranjo', 2),
(20, 'Palmares', 2),
(21, 'Orotina', 2),
(22, 'Poás', 2),
(23, 'Zarcero', 2),
(24, 'Los Chiles', 2),
(25, 'Upala', 2),
(26, 'La Fortuna', 2),
(27, 'San Mateo', 2),
(28, 'Sarchí', 2),
(29, 'Cartago', 3),
(30, 'Paraíso', 3),
(31, 'La Unión', 3),
(32, 'Jiménez', 3),
(33, 'Turrialba', 3),
(34, 'Alvarado', 3),
(35, 'Oreamuno', 3),
(36, 'El Guarco', 3),
(37, 'Heredia', 4),
(38, 'Barva', 4),
(39, 'Santo Domingo', 4),
(40, 'San Rafael', 4),
(41, 'San Isidro', 4),
(42, 'Santa Bárbara', 4),
(43, 'San Pablo', 4),
(44, 'San Juan', 4),
(45, 'Liberia', 5),
(46, 'Nicoya', 5),
(47, 'Santa Cruz', 5),
(48, 'Carrillo', 5),
(49, 'Cañas', 5),
(50, 'Abangares', 5),
(51, 'Bagaces', 5),
(52, 'Tilarán', 5),
(53, 'La Cruz', 5),
(54, 'Hojancha', 5),
(55, 'Puntarenas', 6),
(56, 'Esparza', 6),
(57, 'El Guarco', 6),
(58, 'Buenos Aires', 6),
(59, 'Osa', 6),
(60, 'Quepos', 6),
(61, 'Coto Brus', 6),
(62, 'Golfito', 6),
(63, 'Pérez Zeledón', 6),
(64, 'Corredores', 6),
(65, 'Garabito', 6),
(66, 'Limón', 7),
(67, 'Guácimo', 7),
(68, 'Siquirres', 7),
(69, 'Talamanca', 7),
(70, 'Matina', 7),
(71, 'Pococí', 7),
(72, 'Batán', 7);

INSERT INTO Distritos(distritoID, distrito, cantonID, provinciaID) VALUES 
(1, 'Catedral', 1, 1),
(2, 'El Carmen', 1, 1),
(3, 'Hospital', 1, 1),
(4, 'La Soledad', 1, 1),
(5, 'San Francisco de Dos Ríos', 1, 1),
(6, 'San Sebastián', 1, 1),
(7, 'San Pedro', 1, 1),
(8, 'La Uruca', 1, 1),
(9, 'Mata Redonda', 1, 1),
(10, 'Pavas', 1, 1),
(11, 'Uruca', 1, 1),
(12, 'Escazú', 2, 1),
(13, 'San Antonio', 2, 1),
(14, 'San Miguel', 2, 1),
(15, 'Desamparados', 3, 1),
(16, 'San Miguel', 3, 1),
(17, 'San Juan de Dios', 3, 1),
(18, 'San Rafael Arriba', 3, 1),
(19, 'San Rafael Abajo', 3, 1),
(20, 'San Cristóbal', 3, 1),
(21, 'Patarrá', 3, 1),
(22, 'Tres Ríos', 4, 1),
(23, 'San Diego', 4, 1),
(24, 'San Juan', 4, 1),
(25, 'Santiago', 4, 1),
(26, 'San Vicente', 4, 1),
(27, 'Curridabat', 5, 1),
(28, 'Granadilla', 5, 1),
(29, 'Sánchez', 5, 1),
(30, 'Los Jardines', 5, 1),
(31, 'San Isidro de El General', 6, 1),
(32, 'San Pedro', 6, 1),
(33, 'Daniel Flores', 6, 1),
(34, 'Platanares', 6, 1),
(35, 'Rio Nuevo', 6, 1),
(36, 'Rivas', 6, 1),
(37, 'San Gerardo de Rivas', 6, 1),
(38, 'El General', 6, 1),
(39, 'Quebradas', 6, 1),
(40, 'Turrubares', 7, 1),
(41, 'San Pablo', 7, 1),
(42, 'San Pedro', 7, 1),
(43, 'Ciudad Colón', 8, 1),
(44, 'Guachipelín', 8, 1),
(45, 'Tabarcia', 8, 1),
(46, 'Piedras Negras', 8, 1),
(47, 'San Isidro de El General', 9, 1),
(48, 'Santa María', 9, 1),
(49, 'Tibás', 10, 1),
(50, 'San Juan', 10, 1),
(51, 'San Pedro', 11, 1),
(52, 'San José', 11, 1),
(53, 'Sabanilla', 11, 1),
(54, 'La Trinidad', 11, 1),
(55, 'Alajuelita', 12, 1),
(56, 'San José', 12, 1),
(57, 'San Isidro', 13, 1),
(58, 'San Rafael', 13, 1),
(59, 'San Jerónimo', 13, 1),
(60, 'Dulce Nombre', 13, 1),
(61, 'San Ramón', 14, 1),
(62, 'Alajuela', 1, 2),
(63, 'San José', 1, 2),
(64, 'Desamparados', 1, 2),
(65, 'San Antonio', 1, 2),
(66, 'La Garita', 1, 2),
(67, 'El Coyol', 1, 2),
(68, 'San Isidro', 1, 2),
(69, 'San Rafael', 1, 2),
(70, 'San Mateo', 1, 2),
(71, 'San Francisco', 1, 2),
(72, 'Ciudad Quesada', 2, 2),
(73, 'La Fortuna', 2, 2),
(74, 'Aguas Zarcas', 2, 2),
(75, 'Florencia', 2, 2),
(76, 'Cutris', 2, 2),
(77, 'Pital', 2, 2),
(78, 'Venecia', 2, 2),
(79, 'Grecia', 3, 2),
(80, 'San Isidro', 3, 2),
(81, 'San Juan', 3, 2),
(82, 'San Roque', 3, 2),
(83, 'Tacares', 3, 2),
(84, 'Atenas', 4, 2),
(85, 'Jesús', 4, 2),
(86, 'San José', 4, 2),
(87, 'Escobal', 4, 2),
(88, 'Concepción', 4, 2),
(89, 'San Isidro', 4, 2),
(90, 'Naranjo', 5, 2),
(91, 'San Juan', 5, 2),
(92, 'San Rafael', 5, 2),
(93, 'El Rosario', 5, 2),
(94, 'La Unión', 5, 2),
(95, 'Palmares', 6, 2),
(96, 'Santiago', 6, 2),
(97, 'Esquipulas', 6, 2),
(98, 'Zaragoza', 6, 2),
(99, 'La Granja', 6, 2),
(100, 'Orotina', 7, 2),
(101, 'Coyolar', 7, 2),
(102, 'La Ceiba', 7, 2),
(103, 'Poás', 8, 2),
(104, 'San Pedro', 8, 2),
(105, 'San Juan', 8, 2),
(106, 'San Rafael', 8, 2),
(107, 'Zarcero', 9, 2),
(108, 'San Carlos', 9, 2),
(109, 'Lagunillas', 9, 2),
(110, 'El Jardín', 9, 2),
(111, 'Los Chiles', 10, 2),
(112, 'San Jorge', 10, 2),
(113, 'El Amparo', 10, 2),
(114, 'Upala', 11, 2),
(115, 'Aguas Claras', 11, 2),
(116, 'Bijagua', 11, 2),
(117, 'Cote', 11, 2),
(118, 'La Fortuna', 12, 2),
(119, 'San Mateo', 13, 2),
(120, 'La Lucha', 13, 2),
(121, 'Sarchí Norte', 14, 2),
(122, 'Sarchí Sur', 14, 2),
(123, 'Heredia', 1, 3),
(124, 'San Francisco', 1, 3),
(125, 'Ulloa', 1, 3),
(126, 'Mercedes', 1, 3),
(127, 'San Isidro', 1, 3),
(128, 'Santo Domingo', 1, 3),
(129, 'Barva', 2, 3),
(130, 'San Pedro', 2, 3),
(131, 'San Pablo', 2, 3),
(132, 'Santa Lucia', 2, 3),
(133, 'Santo Domingo', 3, 3),
(134, 'San Vicente', 3, 3),
(135, 'San Miguel', 3, 3),
(136, 'San Juan', 3, 3),
(137, 'San Rafael', 3, 3),
(138, 'Santa Bárbara', 4, 3),
(139, 'San José', 4, 3),
(140, 'Santo Domingo', 4, 3),
(141, 'San Rafael', 5, 3),
(142, 'San José', 5, 3),
(143, 'San Pedro', 5, 3),
(144, 'San Vicente', 5, 3),
(145, 'San Isidro', 6, 3),
(146, 'San Juan', 6, 3),
(147, 'Belén', 7, 3),
(148, 'San Antonio', 7, 3),
(149, 'La Asunción', 7, 3),
(150, 'San Joaquín', 8, 3),
(151, 'San Francisco', 8, 3),
(152, 'Santa Rosa', 8, 3),
(153, 'Puerto Viejo', 9, 3),
(154, 'La Virgen', 9, 3),
(155, 'La Palma', 9, 3),
(156, 'El Roble', 9, 3),
(157, 'Cartago', 1, 4),
(158, 'San Nicolás', 1, 4),
(159, 'San Rafael', 1, 4),
(160, 'Guadalupe', 1, 4),
(161, 'Corralillo', 1, 4),
(162, 'Paraíso', 2, 4),
(163, 'Santiago', 2, 4),
(164, 'Tierra Blanca', 2, 4),
(165, 'Orosi', 2, 4),
(166, 'Llanos de Santa Lucía', 2, 4),
(167, 'Tres Ríos', 3, 4),
(168, 'San Diego', 3, 4),
(169, 'San Juan', 3, 4),
(170, 'San Ramón', 3, 4),
(171, 'Juan Viñas', 4, 4),
(172, 'La Suiza', 4, 4),
(173, 'Jiménez', 4, 4),
(174, 'Turrialba', 5, 4),
(175, 'La Pastora', 5, 4),
(176, 'Santa Teresita', 5, 4),
(177, 'Peralta', 5, 4),
(178, 'Pacayas', 6, 4),
(179, 'Cervantes', 6, 4),
(180, 'San Antonio', 6, 4),
(181, 'San Isidro', 6, 4),
(182, 'San Rafael', 7, 4),
(183, 'San Antonio', 7, 4),
(184, 'San Pedro', 7, 4),
(185, 'El Tejar', 8, 4),
(186, 'San Isidro', 8, 4),
(187, 'Liberia', 1, 5),
(188, 'Cañas Dulces', 1, 5),
(189, 'La Anexión', 1, 5),
(190, 'Nacascolo', 1, 5),
(191, 'Nicoya', 2, 5),
(192, 'San Antonio', 2, 5),
(193, 'Santa Cruz', 2, 5),
(194, 'Nosara', 2, 5),
(195, 'Santa Cruz', 3, 5),
(196, 'Tempate', 3, 5),
(197, 'San Vicente', 3, 5),
(198, 'Huacas', 3, 5),
(199, 'Veintisiete de Abril', 3, 5),
(200, 'Tilarán', 4, 5),
(201, 'Tronadora', 4, 5),
(202, 'Santa Rosa', 4, 5),
(203, 'Bagaces', 5, 5),
(204, 'La Fortuna', 5, 5),
(205, 'Cañas', 5, 5),
(206, 'Carrillo', 6, 5),
(207, 'Sardinal', 6, 5),
(208, 'Coco', 6, 5),
(209, 'Guanacaste', 7, 5),
(210, 'Playa del Coco', 7, 5),
(211, 'La Cruz', 8, 5),
(212, 'Santa Rosa', 8, 5),
(213, 'Puntarenas', 1, 6),
(214, 'El Roble', 1, 6),
(215, 'La Paz', 1, 6),
(216, 'Chacarita', 1, 6),
(217, 'Esparza', 2, 6),
(218, 'San Juan Grande', 2, 6),
(219, 'San Rafael', 2, 6),
(220, 'San Francisco', 2, 6),
(221, 'Buenos Aires', 3, 6),
(222, 'Volcán', 3, 6),
(223, 'Potrero Grande', 3, 6),
(224, 'La Unión', 3, 6),
(225, 'Miramar', 4, 6),
(226, 'El Jardín', 4, 6),
(227, 'San Isidro', 4, 6),
(228, 'Ciudad Cortés', 5, 6),
(229, 'Palmar', 5, 6),
(230, 'Sierpe', 5, 6),
(231, 'Drake', 5, 6),
(232, 'Quepos', 6, 6),
(233, 'Manuel Antonio', 6, 6),
(234, 'Naranjito', 6, 6),
(235, 'Golfito', 7, 6),
(236, 'Ciudad Neily', 7, 6),
(237, 'Coto Brus', 7, 6),
(238, 'San Vito', 8, 6),
(239, 'Las Lomas', 8, 6),
(240, 'El Brujo', 8, 6),
(241, 'Corredor', 9, 6),
(242, 'La Cuesta', 9, 6),
(243, 'San Isidro de El General', 10, 6),
(244, 'El General', 10, 6),
(245, 'Daniel Flores', 10, 6),
(246, 'San Pedro', 10, 6),
(247, 'Limón', 1, 7),
(248, 'Valle La Estrella', 1, 7),
(249, 'Raquel', 1, 7),
(250, 'Matina', 1, 7),
(251, 'Guácimo', 2, 7),
(252, 'San Pedro', 2, 7),
(253, 'Palo Alto', 2, 7),
(254, 'Mercedes', 2, 7),
(255, 'Pococí', 3, 7),
(256, 'Guapiles', 3, 7),
(257, 'Jiménez', 3, 7),
(258, 'La Rita', 3, 7),
(259, 'Siquirres', 4, 7),
(260, 'Pacuarito', 4, 7),
(261, 'La Unión', 4, 7),
(262, 'El Cairo', 4, 7),
(263, 'Bribri', 5, 7),
(264, 'Cahuita', 5, 7),
(265, 'Talamanca', 5, 7),
(266, 'Sixaola', 5, 7);

 -- Procedimientos Almacenados (en caso de error, usar la opcion de Stored Procedures > Click Derecho > Create Stored Procedure en workbench)

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarCliente`(
    pCedula VARCHAR(9),
    pNombre VARCHAR(50),
    pApellido1 VARCHAR(50),
    pApellido2 VARCHAR(50),
    pContrasena VARCHAR(20),
    pProvinciaID INT,
    pCantonID INT,
    pDistritoID INT,
    pOtrasSenas VARCHAR(200),
    pCodigoPostal VARCHAR(10),
    pCorreo VARCHAR(50),
    pTelefono VARCHAR(15)
)
BEGIN
    INSERT INTO `tiendaambienteproyectowebb`.`clientes`(`cedula`, `nombre`, `apellido1`, `apellido2`, `contrasena`, `estadoID`, `rolID`, 
                           `fechaRegistro`, `provinciaID`, `cantonID`, `distritoID`, `otrasSenas`, `codigoPostal`, 
                           `correo`, `telefono`)
    VALUES (pCedula, pNombre, pApellido1, pApellido2, pContrasena, 1, 2, NOW(), 
            pProvinciaID, pCantonID, pDistritoID, pOtrasSenas, pCodigoPostal, pCorreo, pTelefono);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `RecuperarAcceso`(pCorreo varchar(50))
BEGIN

	SELECT	clienteID,
			cedula,
			Nombre,
            apellido1,
            apellido2,
            contrasena,
            estadoID,
            rolID,
            fechaRegistro,
            provinciaID,
            cantonID,
            distritoID,
            otrasSenas,
            codigoPostal,
            correo,
            telefono
	FROM 	tiendaambienteproyectowebb.clientes
	WHERE 	Correo = pCorreo;

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarContrasena`(pCedula VARCHAR(9),
																	pCodigo varchar(10))
BEGIN

	UPDATE 	tiendaambienteproyectowebb.clientes
    SET 	Contrasena = pCodigo
    WHERE	clienteID = pClienteID;

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarCliente`(pClienteID int(11))
BEGIN

	SELECT	C.ClienteID,
			cedula,
			Nombre,
            apellido1,
            apellido2,
            contrasena,
            estadoID,
            E.nombreEstado,
            rolID,
            R.nombreRol,
            fechaRegistro,
            provinciaID,
            cantonID,
            distritoID,
            otrasSenas,
            codigoPostal,
            correo,
            telefono
	FROM 	tiendaambienteproyectowebb.Clientes C
    INNER JOIN tiendaambienteproyectowebb.Roles R ON C.rolID = R.rolID
    INNER JOIN tiendaambienteproyectowebb.Estados E ON C.estadoID = E.estadoID
	WHERE 	C.ClienteID = pClienteID;

END$$
DELIMITER ;
