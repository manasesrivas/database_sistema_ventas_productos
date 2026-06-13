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
    descripcion VARCHAR(50)
);


CREATE TABLE marcas(
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(30),
);