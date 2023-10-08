USE jugos;
CREATE TABLE tbclientes( 
	Dni	VARCHAR(20),
    Nombre VARCHAR(150),
    Direccion1 VARCHAR(150),
    Direccion2 VARCHAR(150),
    Barrio VARCHAR(150),
    Ciudad VARCHAR(50),
    Estado VARCHAR(50),
    Cp VARCHAR(10),
    Edad SMALLINT,
    sexo VARCHAR(1),
    Limite_Credito FLOAT,
    Volumem_Compra FLOAT,
    Primera_Compra BIT(1));