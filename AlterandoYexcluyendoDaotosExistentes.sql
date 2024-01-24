use ventas_jugos;

select * from tb_producto;

 use jugos_ventas;
 select * from tabla_de_productos;
 update tabla_de_productos set PRECIO_DE_LISTA = 666 where CODIGO_DEL_PRODUCTO='1000889';
 update   tabla_de_productos set  NOMBRE_DEL_PRODUCTO='PRUEBA' , TAMANO='2 LITRO' where CODIGO_DEL_PRODUCTO='1000889';
 
 select * from  ventas_jugos.tb_vendedor;
 select * from tabla_de_vendedores;
 
 select * from tabla_de_vendedores A
	inner join
		ventas_jugos.tb_vendedor B 
        on A.MATRICULA=substring(B.MATRICULA,3,3);

update tabla_de_vendedores A 
	inner join
		ventas_jugos.tb_vendedor B 
        on A.MATRICULA=substring(B.MATRICULA,3,3)
			set A.VACACIONES=B.DE_BACACIONES;

select * from jugos_ventas.tabla_de_vendedores;
select * from tb_vendedor;
use ventas_jugos;
	update tb_vendedor A 
	inner join
		jugos_ventas.tabla_de_vendedores B 
        on A.MATRICULA=substring(B.MATRICULA,3,3)
			set A.DE_BACACIONES=B.VACACIONES;

SELECT A.DNI FROM tb_clientes A
INNER JOIN tb_vendedor B
ON A.BARRIO = B.BARRIO

UPDATE tb_clientes A 
INNER JOIN 
tb_vendedor B
ON A.BARRIO = B.BARRIO
SET A.VOLUMEN_COMPRA = A.VOLUMEN_COMPRA * 1.3;

SELECT * FROM tabla_de_productos;

DELETE  FROM tabla_de_productos WHERE TAMANO= '1 Litro';

DELETE A FROM tb_facturas A
INNER JOIN 
tb_clientes B 
ON A.DNI = B.DNI
WHERE B.EDAD < 18;

CREATE TABLE `tabla_de_productos_2` (
  `CODIGO_DEL_PRODUCTO` varchar(10) NOT NULL,
  `NOMBRE_DEL_PRODUCTO` varchar(50) DEFAULT NULL,
  `TAMANO` varchar(10) DEFAULT NULL,
  `SABOR` varchar(20) DEFAULT NULL,
  `ENVASE` varchar(20) DEFAULT NULL,
  `PRECIO_DE_LISTA` float NOT NULL,
  PRIMARY KEY (`CODIGO_DEL_PRODUCTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO tabla_de_productos_2 
	SELECT * FROM tabla_de_productos;
SELECT * FROM tabla_de_productos_2;
UPDATE tabla_de_productos_2 SET PRECIO_DE_LISTA = PRECIO_DE_LISTA*1.15;
