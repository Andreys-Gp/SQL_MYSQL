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
  
  