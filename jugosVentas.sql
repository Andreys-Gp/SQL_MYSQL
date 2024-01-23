use jugos_ventas;
use ventas_jugos;
select * from jugos_ventas.tabla_de_productos;

USE ventas_jugos;

INSERT INTO tb_clientes
SELECT DNI, NOMBRE, DIRECCION_1 AS DIRECCION,
BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO 
AS FECHA_NACIMIENTO, EDAD, SEXO, LIMITE_DE_CREDITO
AS LIMITE_CREDITO, VOLUMEN_DE_COMPRA AS VOLUMEN_COMPRA,
PRIMERA_COMPRA FROM jugos_ventas.tabla_de_clientes
WHERE DNI NOT IN (SELECT DNI FROM tb_clientes);

use jugos_ventas;
select tabla_de_vendedores  from jugos_ventas;