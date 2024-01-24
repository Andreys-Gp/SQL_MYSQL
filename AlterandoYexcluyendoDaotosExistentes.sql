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