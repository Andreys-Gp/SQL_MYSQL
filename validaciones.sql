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
 
 /** filtrando usando CASE() **/
  select * from tabla_de_productos;
  
  select NOMBRE_DEL_PRODUCTO, PRECIO_DE_LISTA,
   case
    when PRECIO_DE_LISTA >=12 then 'ES COSTOSO'
    when PRECIO_DE_LISTA >=5 and PRECIO_DE_LISTA <12 then ' ES ACCESIBLE'
    else 'BARATO' 
   end as PRECIO
   from tabla_de_productos;
   
   /** uniendo tablas de consultas  JOIN **/
   select * from tabla_de_vendedores;
   select * from facturas;
   
   select A.NOMBRE, B.MATRICULA, count(*) from tabla_de_vendedores A 
    inner join
     facturas B
     on A.MATRICULA = B.MATRICULA
		group by A.NOMBRE, B.MATRICULA ; 
   
  
select distinct B.DNI, B.NOMBRE, B.CIUDAD, A.DNI from facturas A 
 right join 
	tabla_de_clientes B
		on A.DNI = B.DNI
			where 	A.DNI is null;
            
	/** FULL JOIN , CROSS JOIN **/
    
select tabla_de_clientes.NOMBRE, tabla_de_clientes.BARRIO, tabla_de_vendedores.NOMBRE
 from tabla_de_clientes 
 inner join  
	tabla_de_vendedores 
    on	tabla_de_clientes.BARRIO=tabla_de_vendedores.BARRIO;
    
select tabla_de_clientes.NOMBRE, tabla_de_clientes.BARRIO, tabla_de_vendedores.NOMBRE
 from tabla_de_clientes 
 left join
	tabla_de_vendedores 
    on	tabla_de_clientes.BARRIO=tabla_de_vendedores.BARRIO;

select tabla_de_clientes.NOMBRE, tabla_de_clientes.BARRIO, tabla_de_vendedores.NOMBRE,VACACIONES
 from tabla_de_clientes 
 full join
	tabla_de_vendedores 
    on	tabla_de_clientes.BARRIO=tabla_de_vendedores.BARRIO;
    
/** full join **/
select tabla_de_clientes.NOMBRE, tabla_de_clientes.CIUDAD, tabla_de_clientes.BARRIO,
			tabla_de_vendedores.NOMBRE,VACACIONES
            from tabla_de_clientes
		left join 
			tabla_de_vendedores
            on
            tabla_de_clientes.BARRIO=tabla_de_vendedores.BARRIO
		union
			select tabla_de_clientes.NOMBRE, tabla_de_clientes.CIUDAD, tabla_de_clientes.BARRIO,
				tabla_de_vendedores.NOMBRE, VACACIONES 
                from 
					tabla_de_clientes
				right join
					tabla_de_vendedores
                    on
						tabla_de_clientes.BARRIO=tabla_de_vendedores.BARRIO;

/** uniendo consultas **/
/** union **/
select 	distinct BARRIO from tabla_de_clientes  
union 
select distinct BARRIO from tabla_de_vendedores;

select 	distinct BARRIO from tabla_de_clientes
union  all
select distinct BARRIO from tabla_de_vendedores;

select distinct BARRIO,NOMBRE,'cliente' as TIPO from tabla_de_clientes
union
select distinct BARRIO,NOMBRE, 'vendedor' as TIPO from tabla_de_vendedores;

/** subconsultas **/ 

select distinct BARRIO from tabla_de_vendedores;

select * from tabla_de_clientes
	where BARRIO in (select distinct BARRIO from tabla_de_vendedores);

select * from tabla_de_productos;
select X.ENVASE, X.PRECIO_MAXIMO from 
	(select ENVASE, max(PRECIO_DE_LISTA) as  PRECIO_MAXIMO from tabla_de_productos 
		group by ENVASE) X where X.PRECIO_MAXIMO >= 10;

/** EXAMPLE **/ 
SELECT DNI, COUNT(*) FROM facturas
WHERE YEAR(FECHA_VENTA) = 2016
GROUP BY DNI
HAVING COUNT(*) > 2000;


			/** VIEW **/ 
            
select ENVASE, max(PRECIO_DE_LISTA) as PRECIO_MAXIMO
	from tabla_de_productos group by ENVASE;
    
    
select X.ENVASE, X.PRECIO_MAXIMO from
	VW_envases_grandes X 	
		where  PRECIO_MAXIMO >= 10;
        

select A.NOMBRE_DEL_PRODUCTO, A.ENVASE, A.PRECIO_DE_LISTA, B.PRECIO_MAXIMO 
	from tabla_de_productos A 
		inner join 	
			VW_envases_grandes B
				on A.ENVASE=B.ENVASE;


				/**  FUNCIONES W3SCHOOLS**/
	select ltrim("    quita los espacios iniciales de una cadena caracteres");
    select rtrim("remueve los espacios finales de un cadena caracteres     ");
    SELECT NOMBRE, CONCAT(DIRECCION_1, ' ', BARRIO, ' ', CIUDAD, ' ', ESTADO) AS COMPLETO FROM tabla_de_clientes;
	
    SELECT DATE("The date is 2017-06-15");
	SELECT CURDATE();
    select current_time();
    select current_date();
    select current_timestamp();
     
	SELECT degrees(ACOS(0.25));
    
SELECT YEAR(FECHA_VENTA), FLOOR(SUM(IMPUESTO * (CANTIDAD * PRECIO))) 
AS RESULTADO
FROM facturas F
INNER JOIN items_facturas IFa ON F.NUMERO = IFa.NUMERO
WHERE YEAR(FECHA_VENTA) = 2016
GROUP BY YEAR(FECHA_VENTA);

select current_timestamp() as RESULTADO;
select concat("la fecha y hora de hoy es: ", current_timestamp()) as RESULTADO;

select concat("la fecha y la hora son: ", 
	date_format(current_timestamp(), "%W,%m,%Y")) as RESULTADO;
    
SELECT CONCAT('El cliente ', TC.NOMBRE, ' facturó ', 
CONVERT(SUM(IFa.CANTIDAD * IFa.precio), CHAR(20))
 , ' en el año ', CONVERT(YEAR(F.FECHA_VENTA), CHAR(20))) AS FRASE FROM facturas F
INNER JOIN items_facturas IFa ON F.NUMERO = IFa.NUMERO
INNER JOIN tabla_de_clientes TC ON F.DNI = TC.DNI
WHERE YEAR(FECHA_VENTA) = 2016
GROUP BY TC.NOMBRE, YEAR(FECHA_VENTA);

SELECT SUBSTRING(CONVERT(23.45, CHAR),3,1) AS RESULTADO;




	




