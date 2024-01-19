create database ventas_jugos;
create schema if not exists ventas_jugos;
drop database ventas_jugos;
create schema if not exists ventas_jugos 
	char set utf32;

use ventas_jugos;

create table tb_vendedor(
MATRICULA varchar(5) not null,
NOMBRE varchar(100) null,
BARRIO varchar(50) null ,
COMISION float null,
FECHA_COMISION date null,
DE_BACACIONES bit(1) null,
primary key (MATRICULA)
);

create table tb_producto(
CODIGO varchar(10) not null,
DESCRIPCION varchar(100) null,
SABOR varchar(50) null,
TAMANO varchar(50) null,
ENVASE varchar(50) null,
PRECIO_LISTA float null,
primary key (CODIGO)
);

CREATE TABLE clientes (
  DNI varchar(11) NOT NULL,
  NOMBRE varchar(100) DEFAULT NULL,
  DIRECCION varchar(150) DEFAULT NULL,
  BARRIO varchar(50) DEFAULT NULL,
  CIUDAD varchar(50) DEFAULT NULL,
  ESTADO varchar(45) DEFAULT NULL,
  CP varchar(8) DEFAULT NULL,
  FECHA_NACIMIENTO date DEFAULT NULL,
  EDAD int(2) DEFAULT NULL,
  SEXO varchar(1) DEFAULT NULL,
  LIMITE_CREDITO float DEFAULT NULL,
  VOLUMEN_COMPRA float DEFAULT NULL,
  PRIMERA_COMPRA bit(1) DEFAULT NULL,
  PRIMARY KEY (DNI));
  
  create table facturas(
  NUMERO int not null,
  FECHA date default null,
  DNI int not null,
  MATRICULA int not null,
  IMPUESTO float null,
  primary key (NUMERO)
  );
  
  drop table facturas;
  
  create table tb_ventas(
  NUMERO varchar(5) not null,
  FECHA date null,
  DNI varchar(11) not null,
  MATRICULA varchar(5) not null,
  IMPUESTO float,
  primary key(NUMERO)
  );
  
  alter table tb_ventas add constraint FK_CLIENTE 
	foreign key (DNI) references tb_clientes(DNI);	 
  
   alter table tb_ventas add constraint FK_VENDEDOR 
	foreign key (MATRICULA) references tb_vendedor(MATRICULA); 

CREATE TABLE items_facturas
(NUMERO VARCHAR(5) NOT NULL,
CODIGO VARCHAR(10) NOT NULL,
CANTIDAD INT,
PRECIO FLOAT,
PRIMARY KEY (NUMERO, CODIGO));

ALTER TABLE items_facturas ADD CONSTRAINT FK_FACTURAS
FOREIGN KEY (NUMERO) REFERENCES facturas(NUMERO);
  
/* renonbrando tabla */
alter table tb_ventas rename tb_facturas;

create table tb_items_facturas(
NUMERO varchar(5) not null,
CODIGO varchar(10) not null,
CANTIDAD int,
PRECIO float,
primary key (NUMERO,CODIGO)
);

ALTER TABLE tb_items_facturas ADD CONSTRAINT FK_FACTURAS
FOREIGN KEY (NUMERO) REFERENCES tb_facturas(NUMERO);

ALTER TABLE tb_items_facturas ADD CONSTRAINT FK_PRODUCTO
FOREIGN KEY (CODIGO) REFERENCES tb_producto(CODIGO);

CREATE TABLE tb_vendedor(
MATRICULA VARCHAR(5) NOT NULL,
NOMBRE VARCHAR(100) NULL,
BARRIO VARCHAR(50) NULL,
COMISION FLOAT NULL,
FECHA_ADMISION DATE NULL,
DE_VACACIONES BIT(1) NULL,
PRIMARY KEY(MATRICULA)
);

CREATE TABLE tb_producto(
CODIGO VARCHAR(10) NOT NULL,
DESCRIPCION VARCHAR(100) NULL,
SABOR VARCHAR(50) NULL,
TAMANO VARCHAR(50) NULL,
ENVASE VARCHAR(50) NULL,
PRECIO_LISTA FLOAT NULL,
PRIMARY KEY (CODIGO)
);

ALTER TABLE tb_facturas ADD CONSTRAINT FK_CLIENTE
FOREIGN KEY (DNI) REFERENCES tb_cliente(DNI);

ALTER TABLE tb_facturas ADD CONSTRAINT FK_VENDEDOR
FOREIGN KEY (MATRICULA) REFERENCES tb_vendedor(MATRICULA);

ALTER TABLE tb_items_facturas ADD CONSTRAINT FK_PRODUCTO
FOREIGN KEY (CODIGO) REFERENCES tb_producto(CODIGO);

use ventas_jugos;

/* insertando datos */

insert into tb_producto (
CODIGO, DESCRIPCION,SABOR,TAMANO,ENVASE,PRECIO_LISTA
) values (
/*primer producto */
'1040107','light','sandia','350 ml','lata',4.56
);
select * from tb_producto;

insert into tb_producto values 
	('1040109','ligth','Asai','350 ml','Lata',5.60),
    ('1040110','ligth','Manzana','350 ml','Lata',6.00),
    ('1040111','ligth','Mango','350 ml','Lata',3.50);
    

