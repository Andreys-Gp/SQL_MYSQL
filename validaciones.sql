/** comando like **/
USE jugos_ventas;
SELECT * FROM tabla_de_productos WHERE SABOR LIKE '%manzana';

/** comando DISTINCT **/
select distinct ENVASE, TAMANO , SABOR from tabla_de_productos where SABOR='NARANJA';

/** filtrando con LIMIT **/
select * from tabla_de_productos ;
select * from tabla_de_productos limit 6;
select * from tabla_de_productos limit 5,3;

/** filtrando consulta ORDER BY **/
select * from tabla_de_productos;
select PRECIO_DE_LISTA, TAMANO from tabla_de_productos order by PRECIO_DE_LISTA asc, TAMANO desc

