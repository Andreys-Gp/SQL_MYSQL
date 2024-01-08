/** informe donde el jerente dela empresa de jugo para saver cuales clientes an echo compras validas 
 y cuales an echo comprar invalidas se establece un limite aleatorio **/ 
 
 select * from facturas;
 select * from items_facturas;
 
 select  F.DNI, F.FECHA_VENTA, IFa.CANTIDAD from facturas F
  inner join 
	items_facturas IFa
    on F.NUMERO=IFa.NUMERO;
    
    /** dia con el año informe **/
  select  F.DNI, date_format(F.FECHA_VENTA, "%m - %Y") as MES_AÑO, IFa.CANTIDAD from facturas F
  inner join 
	items_facturas IFa
    on F.NUMERO=IFa.NUMERO;   
    
    /** cantidad de ventas por mes para cada cliente **/ 
select  F.DNI, date_format(F.FECHA_VENTA, "%m - %Y") as MES_AÑO,
	sum(IFa.CANTIDAD) as CANTIDAD_VENDIDA  
	from facturas F
	inner join 
	items_facturas IFa
    on F.NUMERO=IFa.NUMERO	
		group by  F.DNI, date_format(F.FECHA_VENTA, "%m - %Y"); 
    
    /* limite de ventas por cliente (volumen de compra ( volumen de decilitros)) */

select * from tabla_de_clientes TC;
select DNI, NOMBRE, VOLUMEN_DE_COMPRA from tabla_de_clientes TC;

select  F.DNI, TC.NOMVRE, date_format(F.FECHA_VENTA, "%m - %Y") as MES_AÑO,
	sum(IFa.CANTIDAD) as CANTIDAD_VENDIDA, 
	max(VOLUMEN_DE_COMPRA)/10 as CANTIDAD_MAX 
	from facturas F
	inner join 
	items_facturas IFa
    on F.NUMERO = IFa.NUMERO	
    inner join
    tabla_de_clientes TC 
    on TC.DNI = F.DNI
		group by 	
			F.DNI, TC.NOMBRE, date_format(F.FECHA_VENTA , "%m - %Y"); 

SELECT A.DNI, A.NOMBRE, A.MES_AÑO, 
A.CANTIDAD_VENDIDA - A.CANTIDAD_MAXIMA AS DIFERENCIA,
CASE
   WHEN  (A.CANTIDAD_VENDIDA - A.CANTIDAD_MAXIMA) <= 0 THEN 'Venta Válida'
   ELSE 'Venta Inválida'
END AS STATUS_VENTA, ROUND((1 - (A.CANTIDAD_MAXIMA/A.CANTIDAD_VENDIDA)) * 100,2) AS PORCENTAJE
 FROM(
SELECT F.DNI, TC.NOMBRE, DATE_FORMAT(F.FECHA_VENTA, "%m - %Y") AS MES_AÑO, 
SUM(IFa.CANTIDAD) AS CANTIDAD_VENDIDA, 
MAX(VOLUMEN_DE_COMPRA)/10 AS CANTIDAD_MAXIMA  
FROM facturas F 
INNER JOIN 
items_facturas IFa
ON F.NUMERO = IFa.NUMERO
INNER JOIN 
tabla_de_clientes TC
ON TC.DNI = F.DNI
GROUP BY
F.DNI, TC.NOMBRE, DATE_FORMAT(F.FECHA_VENTA, "%m - %Y"))A
WHERE (A.CANTIDAD_MAXIMA - A.CANTIDAD_VENDIDA) < 0 AND ROUND((1 - (A.CANTIDAD_MAXIMA/A.CANTIDAD_VENDIDA)) * 100,2) > 50
AND A.MES_AÑO LIKE "%2018";

/* ventas por sabor */

SELECT VENTAS_TAMANO.TAMANO, VENTAS_TAMANO.AÑO, VENTAS_TAMANO.CANTIDAD_TOTAL,
ROUND((VENTAS_TAMANO.CANTIDAD_TOTAL/VENTA_TOTAL.CANTIDAD_TOTAL)*100,2) 
AS PORCENTAJE FROM (
SELECT P.TAMANO, SUM(IFa.CANTIDAD) AS CANTIDAD_TOTAL, 
YEAR(F.FECHA_VENTA) AS AÑO FROM
tabla_de_productos P
INNER JOIN
items_facturas IFa
ON P.CODIGO_DEL_PRODUCTO = IFa.CODIGO_DEL_PRODUCTO
INNER JOIN
facturas F
ON F.NUMERO = IFa.NUMERO
WHERE YEAR(F.FECHA_VENTA) = 2016
GROUP BY P.TAMANO, YEAR(F.FECHA_VENTA)
ORDER BY SUM(IFa.CANTIDAD) DESC) VENTAS_TAMANO
INNER JOIN (
SELECT SUM(IFa.CANTIDAD) AS CANTIDAD_TOTAL, 
YEAR(F.FECHA_VENTA) AS AÑO FROM
tabla_de_productos P
INNER JOIN
items_facturas IFa
ON P.CODIGO_DEL_PRODUCTO = IFa.CODIGO_DEL_PRODUCTO
INNER JOIN
facturas F
ON F.NUMERO = IFa.NUMERO
WHERE YEAR(F.FECHA_VENTA) = 2016
GROUP BY YEAR(F.FECHA_VENTA)) VENTA_TOTAL
ON VENTA_TOTAL.AÑO = VENTAS_TAMANO.AÑO
ORDER BY VENTAS_TAMANO.CANTIDAD_TOTAL DESC;

/*Otro ejemplo de informe es el que determina la venta por sabores, para el año de 2016, presentando el 
porcentaje de participación de cada uno de estos sabores, ordenados. */ 

SELECT VENTAS_SABOR.SABOR, VENTAS_SABOR.AÑO, VENTAS_SABOR.CANTIDAD_TOTAL,
ROUND((VENTAS_SABOR.CANTIDAD_TOTAL/VENTA_TOTAL.CANTIDAD_TOTAL)*100,2) 
AS PORCENTAJE FROM (
SELECT P.SABOR, SUM(IFa.CANTIDAD) AS CANTIDAD_TOTAL, 
YEAR(F.FECHA_VENTA) AS AÑO FROM
tabla_de_productos P
INNER JOIN
items_facturas IFa
ON P.CODIGO_DEL_PRODUCTO = IFa.CODIGO_DEL_PRODUCTO
INNER JOIN
facturas F
ON F.NUMERO = IFa.NUMERO
WHERE YEAR(F.FECHA_VENTA) = 2016
GROUP BY P.SABOR, YEAR(F.FECHA_VENTA)
ORDER BY SUM(IFa.CANTIDAD) DESC) VENTAS_SABOR
INNER JOIN (
SELECT SUM(IFa.CANTIDAD) AS CANTIDAD_TOTAL, 
YEAR(F.FECHA_VENTA) AS AÑO FROM
tabla_de_productos P
INNER JOIN
items_facturas IFa
ON P.CODIGO_DEL_PRODUCTO = IFa.CODIGO_DEL_PRODUCTO
INNER JOIN
facturas F
ON F.NUMERO = IFa.NUMERO
WHERE YEAR(F.FECHA_VENTA) = 2016
GROUP BY YEAR(F.FECHA_VENTA)) VENTA_TOTAL
ON VENTA_TOTAL.AÑO = VENTAS_SABOR.AÑO
ORDER BY VENTAS_SABOR.CANTIDAD_TOTAL DESC;


