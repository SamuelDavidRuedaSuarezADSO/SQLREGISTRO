-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 10-05-2024 a las 22:13:44
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `registro_ventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_categoria`
--

CREATE TABLE `tb_categoria` (
  `cod_categ` int NOT NULL,
  `tipo_muebl_categ` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `zona_muebl_categ` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_cliente`
--

CREATE TABLE `tb_cliente` (
  `id_clie` int NOT NULL,
  `nom_clie` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `apell_clie` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telf_clie` int NOT NULL,
  `direcc_clie` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email_clie` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_colores`
--

CREATE TABLE `tb_colores` (
  `cod_color` int NOT NULL,
  `nom_color` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_director`
--

CREATE TABLE `tb_director` (
  `cod_direc` int NOT NULL,
  `id_direc` int NOT NULL,
  `nom_direc` varchar(30) NOT NULL,
  `apell_direc` varchar(30) NOT NULL,
  `direcc_direc` varchar(30) NOT NULL,
  `telf_direc` int NOT NULL,
  `email_direc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_empleado`
--

CREATE TABLE `tb_empleado` (
  `id_emple` int NOT NULL,
  `nom_emple` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `apell_emple` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telf_emple` int NOT NULL,
  `direcc_emple` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email_emple` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `zona_emple` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_factura`
--

CREATE TABLE `tb_factura` (
  `cod_factu` int NOT NULL,
  `fecha_compra_factu` date NOT NULL,
  `cod_pedid_fk` int NOT NULL,
  `total_factu` int DEFAULT NULL,
  `id_emple_fk` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_mueble`
--

CREATE TABLE `tb_mueble` (
  `cod_mueb` int NOT NULL,
  `nom_mueb` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cod_categ_fk` int NOT NULL,
  `descr_mueb` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `color_mueb` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `materi_mueb` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `press_mueb` float NOT NULL,
  `stok_mueb` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_mueble_color`
--

CREATE TABLE `tb_mueble_color` (
  `cod_mueb_fk` int NOT NULL,
  `cod_color_fk` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_mueble_pedido`
--

CREATE TABLE `tb_mueble_pedido` (
  `cod_mueb_fk` int NOT NULL,
  `cod_pedid_fk` int NOT NULL,
  `cantidad_mueble` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_pedidos`
--

CREATE TABLE `tb_pedidos` (
  `cod_pedid` int NOT NULL,
  `id_emple_fk` int NOT NULL,
  `id_clie_fk` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_perfil`
--

CREATE TABLE `tb_perfil` (
  `cod_perfil` int NOT NULL,
  `nom_prefil` varchar(200) NOT NULL,
  `apell_perfil` varchar(200) NOT NULL,
  `emali_perfil` varchar(200) NOT NULL,
  `direcc_perfil` varchar(200) NOT NULL,
  `telf_perfil` int NOT NULL,
  `fk_cod_user` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_permisos`
--

CREATE TABLE `tb_permisos` (
  `cod_oper` int NOT NULL,
  `nom_oper` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_rol`
--

CREATE TABLE `tb_rol` (
  `cod_rol` int NOT NULL,
  `nom_rol` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_rol_permisos`
--

CREATE TABLE `tb_rol_permisos` (
  `fk_cod_rol` int NOT NULL,
  `fk_cod_oper` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_tienda`
--

CREATE TABLE `tb_tienda` (
  `id_tiend` int NOT NULL,
  `nom_tiend` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `direcc_tiend` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ciudad_tiend` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `depart_tiend` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pais_tiend` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email_tiend` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telf_tiend` int NOT NULL,
  `cod_direc_fk` int NOT NULL,
  `estad_tiend` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_tienda_empleado`
--

CREATE TABLE `tb_tienda_empleado` (
  `id_tiend_fk` int NOT NULL,
  `id_emple_fk` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `cod_user` int NOT NULL,
  `nom_user` varchar(200) NOT NULL,
  `email_user` varchar(200) NOT NULL,
  `contra_user` varchar(200) NOT NULL,
  `fecha_user_crea` datetime DEFAULT NULL,
  `fk_cod_rol` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_categoria`
--
ALTER TABLE `tb_categoria`
  ADD PRIMARY KEY (`cod_categ`);

--
-- Indices de la tabla `tb_cliente`
--
ALTER TABLE `tb_cliente`
  ADD PRIMARY KEY (`id_clie`);

--
-- Indices de la tabla `tb_colores`
--
ALTER TABLE `tb_colores`
  ADD PRIMARY KEY (`cod_color`);

--
-- Indices de la tabla `tb_director`
--
ALTER TABLE `tb_director`
  ADD PRIMARY KEY (`cod_direc`);

--
-- Indices de la tabla `tb_empleado`
--
ALTER TABLE `tb_empleado`
  ADD PRIMARY KEY (`id_emple`);

--
-- Indices de la tabla `tb_factura`
--
ALTER TABLE `tb_factura`
  ADD PRIMARY KEY (`cod_factu`),
  ADD KEY `cod_pedid_fk` (`cod_pedid_fk`),
  ADD KEY `id_emple_fk` (`id_emple_fk`);

--
-- Indices de la tabla `tb_mueble`
--
ALTER TABLE `tb_mueble`
  ADD PRIMARY KEY (`cod_mueb`),
  ADD KEY `cod_categ_fk` (`cod_categ_fk`);

--
-- Indices de la tabla `tb_mueble_color`
--
ALTER TABLE `tb_mueble_color`
  ADD KEY `cod_mueb_fk` (`cod_mueb_fk`),
  ADD KEY `cod_color_fk` (`cod_color_fk`);

--
-- Indices de la tabla `tb_mueble_pedido`
--
ALTER TABLE `tb_mueble_pedido`
  ADD KEY `cod_mueb_fk` (`cod_mueb_fk`),
  ADD KEY `cod_pedid_fk` (`cod_pedid_fk`);

--
-- Indices de la tabla `tb_pedidos`
--
ALTER TABLE `tb_pedidos`
  ADD PRIMARY KEY (`cod_pedid`),
  ADD KEY `id_emple_fk` (`id_emple_fk`),
  ADD KEY `id_clie_fk` (`id_clie_fk`);

--
-- Indices de la tabla `tb_perfil`
--
ALTER TABLE `tb_perfil`
  ADD PRIMARY KEY (`cod_perfil`),
  ADD UNIQUE KEY `fk_cod_user` (`fk_cod_user`),
  ADD UNIQUE KEY `fk_cod_user_2` (`fk_cod_user`);

--
-- Indices de la tabla `tb_permisos`
--
ALTER TABLE `tb_permisos`
  ADD PRIMARY KEY (`cod_oper`);

--
-- Indices de la tabla `tb_rol`
--
ALTER TABLE `tb_rol`
  ADD PRIMARY KEY (`cod_rol`);

--
-- Indices de la tabla `tb_rol_permisos`
--
ALTER TABLE `tb_rol_permisos`
  ADD KEY `fk_cod_rol` (`fk_cod_rol`),
  ADD KEY `fk_cod_oper` (`fk_cod_oper`);

--
-- Indices de la tabla `tb_tienda`
--
ALTER TABLE `tb_tienda`
  ADD PRIMARY KEY (`id_tiend`),
  ADD KEY `cod_direc_fk` (`cod_direc_fk`);

--
-- Indices de la tabla `tb_tienda_empleado`
--
ALTER TABLE `tb_tienda_empleado`
  ADD KEY `id_tiend_fk` (`id_tiend_fk`),
  ADD KEY `id_emple_fk` (`id_emple_fk`);

--
-- Indices de la tabla `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`cod_user`),
  ADD KEY `fk_cod_rol` (`fk_cod_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_perfil`
--
ALTER TABLE `tb_perfil`
  MODIFY `cod_perfil` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_permisos`
--
ALTER TABLE `tb_permisos`
  MODIFY `cod_oper` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_rol`
--
ALTER TABLE `tb_rol`
  MODIFY `cod_rol` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `cod_user` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_factura`
--
ALTER TABLE `tb_factura`
  ADD CONSTRAINT `tb_factura_ibfk_1` FOREIGN KEY (`cod_pedid_fk`) REFERENCES `tb_pedidos` (`cod_pedid`),
  ADD CONSTRAINT `tb_factura_ibfk_2` FOREIGN KEY (`id_emple_fk`) REFERENCES `tb_empleado` (`id_emple`);

--
-- Filtros para la tabla `tb_mueble`
--
ALTER TABLE `tb_mueble`
  ADD CONSTRAINT `tb_mueble_ibfk_1` FOREIGN KEY (`cod_categ_fk`) REFERENCES `tb_categoria` (`cod_categ`);

--
-- Filtros para la tabla `tb_mueble_color`
--
ALTER TABLE `tb_mueble_color`
  ADD CONSTRAINT `tb_mueble_color_ibfk_1` FOREIGN KEY (`cod_mueb_fk`) REFERENCES `tb_mueble` (`cod_mueb`),
  ADD CONSTRAINT `tb_mueble_color_ibfk_2` FOREIGN KEY (`cod_color_fk`) REFERENCES `tb_colores` (`cod_color`);

--
-- Filtros para la tabla `tb_mueble_pedido`
--
ALTER TABLE `tb_mueble_pedido`
  ADD CONSTRAINT `tb_mueble_pedido_ibfk_1` FOREIGN KEY (`cod_mueb_fk`) REFERENCES `tb_mueble` (`cod_mueb`),
  ADD CONSTRAINT `tb_mueble_pedido_ibfk_2` FOREIGN KEY (`cod_pedid_fk`) REFERENCES `tb_pedidos` (`cod_pedid`);

--
-- Filtros para la tabla `tb_pedidos`
--
ALTER TABLE `tb_pedidos`
  ADD CONSTRAINT `tb_pedidos_ibfk_1` FOREIGN KEY (`id_emple_fk`) REFERENCES `tb_empleado` (`id_emple`),
  ADD CONSTRAINT `tb_pedidos_ibfk_2` FOREIGN KEY (`id_clie_fk`) REFERENCES `tb_cliente` (`id_clie`);

--
-- Filtros para la tabla `tb_perfil`
--
ALTER TABLE `tb_perfil`
  ADD CONSTRAINT `tb_perfil_ibfk_1` FOREIGN KEY (`fk_cod_user`) REFERENCES `tb_usuario` (`cod_user`);

--
-- Filtros para la tabla `tb_rol_permisos`
--
ALTER TABLE `tb_rol_permisos`
  ADD CONSTRAINT `tb_rol_permisos_ibfk_1` FOREIGN KEY (`fk_cod_rol`) REFERENCES `tb_rol` (`cod_rol`),
  ADD CONSTRAINT `tb_rol_permisos_ibfk_2` FOREIGN KEY (`fk_cod_oper`) REFERENCES `tb_permisos` (`cod_oper`);

--
-- Filtros para la tabla `tb_tienda`
--
ALTER TABLE `tb_tienda`
  ADD CONSTRAINT `tb_tienda_ibfk_1` FOREIGN KEY (`cod_direc_fk`) REFERENCES `tb_director` (`cod_direc`);

--
-- Filtros para la tabla `tb_tienda_empleado`
--
ALTER TABLE `tb_tienda_empleado`
  ADD CONSTRAINT `tb_tienda_empleado_ibfk_1` FOREIGN KEY (`id_tiend_fk`) REFERENCES `tb_tienda` (`id_tiend`),
  ADD CONSTRAINT `tb_tienda_empleado_ibfk_2` FOREIGN KEY (`id_emple_fk`) REFERENCES `tb_empleado` (`id_emple`);

--
-- Filtros para la tabla `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD CONSTRAINT `tb_usuario_ibfk_1` FOREIGN KEY (`fk_cod_rol`) REFERENCES `tb_rol` (`cod_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
