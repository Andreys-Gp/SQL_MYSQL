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
		group by  F.DNI, date_format(F.FECHA_VENTA, "%m - %Y") ; 
    
    
    



