USE jugos_ventas;
/*SELECT DNI, NOMBRE FROM tabla_de_clientes*/
SELECT DNI AS IDENTIICACION, NOMBRE AS CLIENTE FROM tabla_de_clientes;

SELECT * FROM tabla_de_productos WHERE SABOR='Uva';

/* entre intervalos */
SELECT * FROM tabla_de_productos WHERE PRECIO_DE_LISTA BETWEEN 16 AND 16.02;

