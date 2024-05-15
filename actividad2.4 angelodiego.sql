-- --------------------------------------------------------
-- Host:                         10.68.0.251
-- Versión del servidor:         5.7.21 - MySQL Community Server (GPL)
-- SO del servidor:              Linux
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para terceraformanormalangelodiego
CREATE DATABASE IF NOT EXISTS `terceraformanormalangelodiego` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `terceraformanormalangelodiego`;

-- Volcando estructura para tabla terceraformanormalangelodiego.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellido` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccion` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla terceraformanormalangelodiego.clientes: ~2 rows (aproximadamente)
INSERT INTO `clientes` (`id_cliente`, `nombre`, `apellido`, `telefono`, `email`, `direccion`) VALUES
	(1, 'Juan', 'Perez', 111, 'juanpe@gmail.com', 'ovalle'),
	(2, 'Mauro', 'Rojas', 79, 'mauroro@gmail.com', 'los vilos');

-- Volcando estructura para tabla terceraformanormalangelodiego.detalles_pedido
CREATE TABLE IF NOT EXISTS `detalles_pedido` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalles_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  CONSTRAINT `detalles_pedido_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla terceraformanormalangelodiego.detalles_pedido: ~2 rows (aproximadamente)
INSERT INTO `detalles_pedido` (`id_detalle`, `id_pedido`, `id_producto`, `cantidad`) VALUES
	(1, 1, 1, 2),
	(2, 2, 2, 1);

-- Volcando estructura para tabla terceraformanormalangelodiego.pedidos
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla terceraformanormalangelodiego.pedidos: ~2 rows (aproximadamente)
INSERT INTO `pedidos` (`id_pedido`, `id_cliente`, `fecha`, `total`) VALUES
	(1, 1, '2024-08-11', 4000),
	(2, 2, '2024-03-09', 14000);

-- Volcando estructura para tabla terceraformanormalangelodiego.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_pro` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla terceraformanormalangelodiego.productos: ~2 rows (aproximadamente)
INSERT INTO `productos` (`id_producto`, `nombre_pro`, `descripcion`, `precio`) VALUES
	(1, 'MediaLuna', 'pieza de panaderia', 10000),
	(2, 'caffe latte', 'expresso y leche a vapor', 4000);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
