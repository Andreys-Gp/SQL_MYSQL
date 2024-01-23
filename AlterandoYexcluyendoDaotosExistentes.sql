use ventas_jugos;

select * from tb_producto;

 use jugos_ventas;
 select * from tabla_de_productos;
 update tabla_de_productos set PRECIO_DE_LISTA = 666 where CODIGO_DEL_PRODUCTO='1000889';
 update   tabla_de_productos set  NOMBRE_DEL_PRODUCTO='PRUEBA' , TAMANO='2 LITRO' where CODIGO_DEL_PRODUCTO='1000889';
 

