delimiter $$

CREATE DATABASE `tpjspferreteria` /*!40100 DEFAULT CHARACTER SET latin1 */$$
use tpjspferreteria$$

CREATE TABLE `productos` (
  `idProductos` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `stock` int(11) unsigned NOT NULL,
  `imagen` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idProductos`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1$$

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci$$

CREATE TABLE `compras` (
  `estado` int(1) NOT NULL DEFAULT '1',
  `idCompras` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `total` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`idCompras`),
  KEY `idUsuario_idx` (`idUsuario`),
  CONSTRAINT `idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsr`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1$$

CREATE
DEFINER=`root`@`localhost`
TRIGGER `tpjspferreteria`.`baja`
BEFORE UPDATE ON `tpjspferreteria`.`compras`
FOR EACH ROW
BEGIN
	if NEW.estado = 3 then
		call bajarstock(NEW.idCompras);
		call generapiqueo(NEW.idCompras);
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1$$

CREATE TABLE `piqueos` (
  `idpiqueo` int(11) NOT NULL,
  `idCompras` int(11) NOT NULL,
  `estado` int(1) DEFAULT '1',
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`idpiqueo`,`idCompras`),
  KEY `idCompras_idx` (`idCompras`),
  CONSTRAINT `idCompras` FOREIGN KEY (`idCompras`) REFERENCES `compras` (`idCompras`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

CREATE PROCEDURE bajarstock (in idComp INT)
begin
update productos p 
inner join prodxcomp l
on p.idProductos = l.idProd and l.idCompra = idComp
set p.stock = p.stock-l.cantidad;
end $$

create procedure generapiqueo( in idComp INT)
begin
declare est int;
declare maxid int;
select max(idpiqueo) into maxid from piqueos;
select estado into est from piqueos where idpiqueo = maxid limit 1;
if maxid = null then	-- si el estado es null pque no hay crea el primer piqueo
	insert into piqueos(idpiqueo,idCompras,estado) VALUES (1,idComp,1); 
end if;
if est = 1 then	-- si el estado del ultimo piqueo es 1 significa que no esta procesado y lo agrega
	insert into piqueos(idpiqueo,idCompras,estado) VALUES (maxid,idComp,1);
end if;
if est != 1 then	-- si el estado del ultimo piqueo es distinto de 1 significa que ya esta entregado y crea un piqueo nuevo
	insert into piqueos(idpiqueo,idCompras,estado) VALUES (maxid+1,idComp,1);
end if;
end$$

start transaction;$$
INSERT INTO productos(nombre,precio,stock,imagen)VALUES('pernos',10,500,'img/noimage.jpg');$$
INSERT INTO productos(nombre,precio,stock,imagen)VALUES('picoloro',50,200,'img/noimage.jpg');$$
INSERT INTO productos(nombre,precio,stock,imagen)VALUES('tenza',45,300,'img/noimage.jpg'); $$
INSERT INTO productos(nombre,precio,stock,imagen)VALUES('juego de tubos',80,20,'img/noimage.jpg');$$
INSERT INTO productos(nombre,precio,stock,imagen)VALUES('atornillador automatico',250,10,'img/noimage.jpg');$$
INSERT INTO productos(nombre,precio,stock,imagen)VALUES('llave de presion',40,100,'img/noimage.jpg');$$
INSERT INTO productos(nombre,precio,stock,imagen)VALUES('lijadora',210,20,'img/noimage.jpg');$$
INSERT INTO productos(nombre,precio,stock,imagen)VALUES('serrucho',60,100,'img/noimage.jpg');$$
INSERT INTO productos(nombre,precio,stock,imagen)VALUES('sierra',50,200,'img/noimage.jpg');$$
INSERT INTO productos(nombre,precio,stock,imagen)VALUES('cinta metrica',15,300,'img/noimage.jpg');$$
INSERT INTO productos(nombre,precio,stock,imagen)VALUES('clavos',12,1000,'img/noimage.jpg');$$
INSERT INTO productos(nombre,precio,stock,imagen)VALUES('tornillos',15,1000,'img/noimage.jpg');$$
INSERT INTO productos(nombre,precio,stock,imagen)VALUES('amoladora',300,20,'img/noimage.jpg');$$
INSERT INTO productos(nombre,precio,stock,imagen)VALUES('Taladro',320,200,'img/noimage.jpg');$$
INSERT INTO productos(nombre,precio,stock,imagen)VALUES('caladora',270,20,'img/noimage.jpg');$$
INSERT INTO productos(nombre,precio,stock,imagen)VALUES('circular',350,20,'img/noimage.jpg');$$
INSERT INTO productos(nombre,precio,stock,imagen)VALUES('martillo',35,100,'img/noimage.jpg');$$
INSERT INTO productos(nombre,precio,stock,imagen)VALUES('pincel',17,100,'img/noimage.jpg');$$
INSERT INTO productos(nombre,precio,stock,imagen)VALUES('pinza',28,100,'img/noimage.jpg');$$
INSERT INTO usuarios(usuario,pass,dni,nombre,apellido,tipo)VALUES('admin','admin',12345678,'admin','admin',1);$$
INSERT INTO usuarios(usuario,pass,dni,nombre,apellido,tipo)VALUES('user','user',2345678,'user','user',2);$$
INSERT INTO usuarios(usuario,pass,dni,nombre,apellido,tipo)VALUES('lean','1234',3456789,'leandro','santillan',2);$$
INSERT INTO usuarios(usuario,pass,dni,nombre,apellido,tipo)VALUES('mate','mate',4567890,'Gaston','Fernandez',2);$$
INSERT INTO usuarios(usuario,pass,dni,nombre,apellido,tipo)VALUES('charlie','charlie',567890,'Carlos','Saganias',2);$$
INSERT INTO usuarios(usuario,pass,dni,nombre,apellido,tipo)VALUES('fede','fede',67890,'Federico','Muñoz',2);$$
INSERT INTO usuarios(usuario,pass,dni,nombre,apellido,tipo)VALUES('edii','edii',7890,'edii','edii',2);$$
INSERT INTO usuarios(usuario,pass,dni,nombre,apellido,tipo)VALUES('matute','matute',890,'matute','matute',2);$$
INSERT INTO compras(estado,idCompras,idUsuario,fecha,total)VALUES(3,1,1,'20141007152017',300)$$
INSERT INTO prodxcomp(idCompra,idProd,cantidad,precioUnit,idLinea)VALUES(1,8,5,60,1)$$
INSERT INTO piqueos(idpiqueo,idCompras,estado,fecha)VALUES(1,1,2,'20141007152017')$$
commit;$$