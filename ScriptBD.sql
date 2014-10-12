delimiter $$

CREATE DATABASE `tpjspferreteria` /*!40100 DEFAULT CHARACTER SET latin1 */$$
use tpjspferreteria$$

CREATE TABLE `productos` (
  `idProductos` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `stock` int(11) unsigned NOT NULL,
  PRIMARY KEY (`idProductos`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1$$

CREATE TABLE `usuarios` (
  `usuario` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `pass` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `DNI` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE latin1_spanish_ci DEFAULT '<SinNombre>',
  `apellido` varchar(45) COLLATE latin1_spanish_ci DEFAULT '<SinApellido>',
  `tipo` int(11) NOT NULL DEFAULT '2',
  `idUsr` int(11) NOT NULL AUTO_INCREMENT,
  `estado` bit(1) DEFAULT b'1',
  PRIMARY KEY (`idUsr`),
  UNIQUE KEY `DNI_UNIQUE` (`DNI`),
  UNIQUE KEY `idUsr_UNIQUE` (`idUsr`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci$$

CREATE TABLE `compras` (
  `estado` int(1) NOT NULL DEFAULT '1',
  `idCompras` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `total` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`idCompras`),
  KEY `idUsuario_idx` (`idUsuario`),
  CONSTRAINT `idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsr`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1$$

CREATE
DEFINER=`root`@`localhost`
TRIGGER `tpjspferreteria`.`bajarstock`
BEFORE UPDATE ON `tpjspferreteria`.`compras`
FOR EACH ROW
BEGIN
	if estado = 3 then
		call bajarstock(idCompras);
	end if;
  END
$$

CREATE TABLE `prodxcomp` (
  `idCompra` int(11) NOT NULL,
  `idProd` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precioUnit` decimal(10,0) DEFAULT NULL,
  `idLinea` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idLinea`),
  KEY `idCompra_idx` (`idCompra`),
  KEY `idProd_idx` (`idProd`),
  CONSTRAINT `idCompra` FOREIGN KEY (`idCompra`) REFERENCES `compras` (`idCompras`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idProd` FOREIGN KEY (`idProd`) REFERENCES `productos` (`idProductos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=latin1$$


CREATE PROCEDURE bajarstock (in idComp INT)
begin
update productos p 
inner join prodxcomp l
on p.idProductos = l.idprod and l.idCompra = idComp
set p.stock = p.stock-l.cantidad;
end$$

start transaction;$$
INSERT INTO productos(nombre,precio,stock)VALUES('pernos',10,500);$$
INSERT INTO productos(nombre,precio,stock)VALUES('picoloro',50,200);$$
INSERT INTO productos(nombre,precio,stock)VALUES('tenza',45,300); $$
INSERT INTO productos(nombre,precio,stock)VALUES('juego de tubos',80,20);$$
INSERT INTO productos(nombre,precio,stock)VALUES('atornillador automatico',250,10);$$
INSERT INTO productos(nombre,precio,stock)VALUES('llave de presion',40,100);$$
INSERT INTO productos(nombre,precio,stock)VALUES('lijadora',210,20);$$
INSERT INTO productos(nombre,precio,stock)VALUES('serrucho',60,100);$$
INSERT INTO productos(nombre,precio,stock)VALUES('sierra',50,200);$$
INSERT INTO productos(nombre,precio,stock)VALUES('cinta metrica',15,300);$$
INSERT INTO productos(nombre,precio,stock)VALUES('clavos',12,1000);$$
INSERT INTO productos(nombre,precio,stock)VALUES('tornillos',15,1000);$$
INSERT INTO productos(nombre,precio,stock)VALUES('amoladora',300,20);$$
INSERT INTO productos(nombre,precio,stock)VALUES('Taladro',320,200);$$
INSERT INTO productos(nombre,precio,stock)VALUES('caladora',270,20);$$
INSERT INTO productos(nombre,precio,stock)VALUES('circular',350,20);$$
INSERT INTO productos(nombre,precio,stock)VALUES('martillo',35,100);$$
INSERT INTO productos(nombre,precio,stock)VALUES('pincel',17,100);$$
INSERT INTO productos(nombre,precio,stock)VALUES('pinza',28,100);$$
INSERT INTO usuarios(usuario,pass,dni,nombre,apellido,tipo)VALUES('admin','admin',12345678,'admin','admin',1);$$
INSERT INTO usuarios(usuario,pass,dni,nombre,apellido,tipo)VALUES('user','user',2345678,'user','user',2);$$
INSERT INTO usuarios(usuario,pass,dni,nombre,apellido,tipo)VALUES('asd','asd',3456789,'asd','asd',2);$$
INSERT INTO usuarios(usuario,pass,dni,nombre,apellido,tipo)VALUES('dsa','dsa',4567890,'dsa','dsa',2);$$
INSERT INTO usuarios(usuario,pass,dni,nombre,apellido,tipo)VALUES('qwe','qwe',567890,'qwe','qwe',2);$$
INSERT INTO usuarios(usuario,pass,dni,nombre,apellido,tipo)VALUES('ewq','ewq',67890,'ewq','ewq',2);$$
INSERT INTO usuarios(usuario,pass,dni,nombre,apellido,tipo)VALUES('edii','edii',7890,'edii','edii',2);$$
INSERT INTO usuarios(usuario,pass,dni,nombre,apellido,tipo)VALUES('matute','matute',890,'matute','matute',2);$$
commit;$$