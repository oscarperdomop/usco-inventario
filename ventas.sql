-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-08-2020 a las 02:35:27
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id_producto` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_imagen` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `fechaCaptura` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id_producto`, `id_categoria`, `id_imagen`, `id_usuario`, `nombre`, `descripcion`, `cantidad`, `precio`, `fechaCaptura`) VALUES
(7, 3, 7, 1, 'Ajiaco', 'Sopa de ajiaco con ingredientes de la región. ', 22, 8500, '2020-08-28'),
(8, 5, 8, 1, 'Chorizos', 'Chorizos marca Brisas 500gr.', 40, 1500, '2020-08-28'),
(9, 6, 9, 1, 'Mojarra Roja Frita', 'Mojarra Frita mas acompañantes de la región.', 15, 17500, '2020-08-28'),
(10, 8, 10, 1, 'Bizcochos', 'Bizcochos huilenses, bolsa 30 unids.', 50, 2500, '2020-08-28'),
(11, 8, 11, 1, 'Asado', 'Plato Asado, porción 750gr mas acompañante de la región.', 20, 19000, '2020-08-28'),
(12, 8, 12, 1, 'Lechona', 'Plato Lechona. 500gr', 60, 4500, '2020-08-28'),
(13, 7, 13, 1, 'Queso', 'Queso Huilense', 30, 3500, '2020-08-28'),
(14, 8, 14, 1, 'Achira Orginal', 'Paquete Achira, bolsa 15 unids.', 50, 2000, '2020-08-28'),
(15, 8, 15, 1, 'Morcilla o Rellena', 'morcilla o rellena original de la región mas papa. x 500gr.', 100, 3500, '2020-08-28'),
(16, 8, 16, 1, 'Tamales', 'Tamal Original de la región, unid.', 40, 4000, '2020-08-28'),
(17, 3, 17, 2, 'Sancocho de gallina', 'Sopa de gallina con presa de pollo y mazorca', 20, 9000, '2020-08-29'),
(18, 6, 18, 2, 'ceviche de camaron', 'ceviche de 250 gr con galletas', 60, 12000, '2020-08-29'),
(19, 7, 19, 2, 'Kumis', 'Kumis casero opita', 8000, 40, '2020-08-29'),
(20, 7, 20, 2, 'Yogurth casero', 'de fresa, mora ,melocoton, guanabana', 30, 7000, '2020-08-29'),
(21, 4, 21, 2, 'Costillas ahumadas', 'costillas de cerdo de 250 gr', 60, 12000, '2020-08-29'),
(22, 4, 22, 2, 'chunchulla', 'picada de chunchulla de 200 gr', 10, 5000, '2020-08-29'),
(23, 5, 23, 2, 'Longaniza', 'longaniza de rivera, ahumada', 40, 7000, '2020-08-29'),
(24, 8, 24, 2, 'Empanada', 'de carne, de res y cerdo, con huevo', 700, 700, '2020-08-29'),
(25, 8, 25, 2, 'papa rellena', 'con chicharron , carne molida y aji', 4000, 1500, '2020-08-29'),
(26, 8, 26, 2, 'Juan Valerio', 'rico juan valerio con chicharron y patacon', 20, 1200, '2020-08-29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombreCategoria` varchar(150) DEFAULT NULL,
  `fechaCaptura` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `id_usuario`, `nombreCategoria`, `fechaCaptura`) VALUES
(3, 1, 'Sopas', '2020-08-28'),
(4, 1, 'Carnes', '2020-08-28'),
(5, 1, 'Embutidos', '2020-08-28'),
(6, 1, 'Pescado', '2020-08-28'),
(7, 1, 'Lácteos ', '2020-08-28'),
(8, 1, 'Preparados Huilenses', '2020-08-28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `apellido` varchar(200) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `telefono` varchar(200) DEFAULT NULL,
  `rfc` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `id_usuario`, `nombre`, `apellido`, `direccion`, `email`, `telefono`, `rfc`) VALUES
(1, 1, 'Ceminsumos', 'SAS', 'Neiva - Huila', 'ceminsumos@hotmail.com', '3251616', '81114999'),
(2, 2, 'comun', 'comun', 'comun', 'comun', '0', '0'),
(3, 2, 'juan valentin', 'perdomo bonilla', 'calle 19a sur n° 21b-37', 'juanpb902@gmail.com', '3184807217', '105654334'),
(4, 2, 'Robert', 'Lewandoski', 'Polonia', 'Lewangol@gmail.com', '32332242334', '03039544');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes`
--

CREATE TABLE `imagenes` (
  `id_imagen` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(500) DEFAULT NULL,
  `ruta` varchar(500) DEFAULT NULL,
  `fechaSubida` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `imagenes`
--

INSERT INTO `imagenes` (`id_imagen`, `id_categoria`, `nombre`, `ruta`, `fechaSubida`) VALUES
(7, 3, 'sopa.jpg', '../../archivos/sopa.jpg', '2020-08-28'),
(8, 5, 'brisas.jpg', '../../archivos/brisas.jpg', '2020-08-28'),
(9, 6, 'pez.jpg', '../../archivos/pez.jpg', '2020-08-28'),
(10, 8, 'cochos.jpg', '../../archivos/cochos.jpg', '2020-08-28'),
(11, 8, 'asado.jpg', '../../archivos/asado.jpg', '2020-08-28'),
(12, 8, 'lechona.jpg', '../../archivos/lechona.jpg', '2020-08-28'),
(13, 7, 'queso.jpg', '../../archivos/queso.jpg', '2020-08-28'),
(14, 8, 'achiras.jpg', '../../archivos/achiras.jpg', '2020-08-28'),
(15, 8, 'rellena.jpg', '../../archivos/rellena.jpg', '2020-08-28'),
(16, 8, 'tamales.jpg', '../../archivos/tamales.jpg', '2020-08-28'),
(17, 3, 'sancocho.jpg', '../../archivos/sancocho.jpg', '2020-08-29'),
(18, 6, 'ceviche.jpg', '../../archivos/ceviche.jpg', '2020-08-29'),
(19, 7, 'kumis.jpg', '../../archivos/kumis.jpg', '2020-08-29'),
(20, 7, 'yogurth.jpg', '../../archivos/yogurth.jpg', '2020-08-29'),
(21, 4, 'costillas.jpg', '../../archivos/costillas.jpg', '2020-08-29'),
(22, 4, 'chunchulla.jpg', '../../archivos/chunchulla.jpg', '2020-08-29'),
(23, 5, 'longaniza.jpg', '../../archivos/longaniza.jpg', '2020-08-29'),
(24, 8, 'empanada.jpg', '../../archivos/empanada.jpg', '2020-08-29'),
(25, 8, 'papa.jpg', '../../archivos/papa.jpg', '2020-08-29'),
(26, 8, 'juanValerio.jpg', '../../archivos/juanValerio.jpg', '2020-08-29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` tinytext DEFAULT NULL,
  `fechaCaptura` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `email`, `password`, `fechaCaptura`) VALUES
(1, 'Oscar Perdomo', 'S', 'Zartival', '4e7afebcfbae000b22c7c85e5560f89a2a0280b4', '2020-08-21'),
(2, 'admin', 'admin', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', '2020-08-29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `fechaCompra` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `id_cliente`, `id_producto`, `id_usuario`, `precio`, `fechaCompra`) VALUES
(3, 1, 3, 1, 2500, '2020-08-28'),
(3, 1, 3, 1, 2500, '2020-08-28'),
(4, 4, 7, 2, 8500, '2020-08-29'),
(4, 4, 7, 2, 8500, '2020-08-29'),
(4, 4, 7, 2, 8500, '2020-08-29');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD PRIMARY KEY (`id_imagen`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  MODIFY `id_imagen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
