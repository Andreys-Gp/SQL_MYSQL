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
select PRECIO_DE_LISTA, TAMANO from tabla_de_productos order by PRECIO_DE_LISTA asc, TAMANO desc;

/** filtrando con GROUP BY sum() max() min() avg() promedio count()**/
select * from tabla_de_productos;
select * from tabla_de_clientes;
select ESTADO, sum(LIMITE_DE_CREDITO) as LIMITE_TOTAL from tabla_de_clientes group by ESTADO;
select * from tabla_de_clientes;
select CIUDAD, BARRIO , sum(LIMITE_DE_CREDITO) as LIMITE_TOTAL from tabla_de_clientes where CIUDAD='ciudad de mexico' group by BARRIO;

/** filtrando datos con HAVING **/ 
 select CIUDAD, BARRIO , sum(LIMITE_DE_CREDITO) as LIMITE_TOTAL from tabla_de_clientes group by BARRIO
 having LIMITE_TOTAL>70000;
 
 select ENVASE , max(PRECIO_DE_LISTA) as PRECIO_MAXIMO, min(PRECIO_DE_LISTA) as PRECIO_MINIMO 
   from tabla_de_productos group by ENVASE;
   
select ENVASE, max(PRECIO_DE_LISTA) as PRECIO_MAXIMO, min(PRECIO_DE_LISTA) as PRECIO_MAXIMO
 from tabla_de_productos group by ENVASE having sum(PRECIO_DE_LISTA)>80;
 
 
 
