CREATE DATABASE IF NOT EXISTS sistema_ventas;
USE sistema_ventas;

-- este codigo es para elminar la base de datos si desean
-- descomentar si se usará
-- DROP DATABASE sistema_ventas;


-- =========================
-- TABLA ROLES
-- =========================
CREATE TABLE roles (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    rol VARCHAR(50)
);

-- =========================
-- TABLA CLIENTE
-- =========================
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(100) NOT NULL,
    dui VARCHAR(10),
    nit VARCHAR(20),
    tipo VARCHAR(2),
    nrc VARCHAR(15),
    correo_electronico VARCHAR(100),
    telefono VARCHAR(20),
    direccion VARCHAR(150),
    eliminado VARCHAR(1)
);

-- =========================
-- TABLA CATEGORIA
-- =========================
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    categoria VARCHAR(100) NOT NULL,
    descripcion TEXT
);

CREATE TABLE descuentos (
    id_descuento INT AUTO_INCREMENT PRIMARY KEY,
    descuento TINYINT, -- se deja entero para posteriormente convertirlo a decimal
    descripcion VARCHAR(50),
    estado VARCHAR(50)
);


CREATE TABLE marcas(
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(30),
    estado TINYINT
);

CREATE TABLE productos(
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(20),
    marca_id INT,
    precio INT,
    categoria_id INT,
    stock INT,
    imagen VARCHAR(255),
    modelo VARCHAR(50),
    caracteristicas VARCHAR(255),
    eliminado VARCHAR(1),
    FOREIGN KEY(categoria_id) REFERENCES categorias(id_categoria),
    FOREIGN KEY(marca_id) REFERENCES marcas(id_marca)
);
CREATE TABLE ventas(
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    fecha_venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total INT,
    descuento_id INT,
    cliente_id INT,
    usuario_id INT,
    estado VARCHAR(10) DEFAULT 'activo'
    -- FOREIGN KEY(cliente_id) REFERENCES clientes(id_cliente),
    -- FOREIGN KEY(usuario_id) REFERENCES usuarios(id_usuario),
    -- FOREIGN KEY(descuento_id) REFERENCES descuentos(id_descuento)
);

CREATE TABLE detalle_ventas(
    id_detalle_venta INT AUTO_INCREMENT PRIMARY KEY,
    venta_id INT,
    producto_id INT,
    subtotal INT,
    cantidad INT,
    -- FOREIGN KEY(producto_id) REFERENCES usuarios(id_producto),
    FOREIGN KEY(venta_id) REFERENCES ventas(id_venta)
);

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(100) NOT NULL,
    rol_id INT
);
USE sistema_ventas;
INSERT INTO categorias( categoria ) VALUES('Teclados');
INSERT INTO marcas( marca ) VALUES('HP');


SELECT * FROM categorias;

UPDATE categorias
    SET categoria = 'lsdlf',
        descripcion = null
    WHERE id_categoria = 1;


CREATE TABLE `tbl_usuarios` (
  `IdUsuario` int(11) NOT NULL,
  `NombreCompleto` varchar(100) NOT NULL,
  `Usuario` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `TipoCuenta` enum('ADMINISTRADOR','VENDEDOR') NOT NULL,
  `Eliminado` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD PRIMARY KEY (`IdUsuario`),
  ADD UNIQUE KEY `Usuario` (`Usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  MODIFY `IdUsuario` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;



-- Administrador:
-- Usuario: admin
-- Contraseña: Admin123*

-- Vendedor:
-- Usuario: lramirez
-- Contraseña: Vendedor123*


INSERT INTO tbl_usuarios(NombreCompleto, Usuario, `Password`, TipoCuenta, Eliminado)
VALUES ('Administrador del Sistema', 'admin', '$2y$12$dACYyTFygqcnGoYRpJPhVu5smwsNTXOVsEBQFb1fy8QeSX8ILCfG.', 'ADMINISTRADOR', 'N');

INSERT INTO tbl_usuarios (NombreCompleto, Usuario, `Password`, TipoCuenta, Eliminado)
VALUES('Luis Fernando Ramírez', 'lramirez', '$2y$12$Ll3zF84xsh6dwRNulJtemeeni0JSG6F.o9gOLvzGWiDwdFEiDvOEG', 'VENDEDOR', 'N');