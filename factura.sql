CREATE DATABASE facturas;
USE facturas;
CREATE TABLE cliente(
id_cliente int primary key not null,
nombre varchar(50) not null,
apellido varchar(50) not null,
dirección varchar(100) not null,
teléfono varchar(10) not null,
email varchar(100) not null
);
CREATE TABLE producto(
id_producto int primary key not null,
nombre varchar(50) not null,
descripción varchar(100) not null,
precio int not null,
stock int not null
);
CREATE TABLE factura(
id_factura int primary key not null,
fecha_emision date not null,
total int not null,
metodo_pago enum('efectivo', 'tarjeta', 'trasferencia') not null,
cod_cliente int not null,
cod_empleado int not null,
foreign key(cod_cliente)references cliente(id_cliente),
foreign key(cod_empleado)references empleado(id_empleado)
);
#modificar la tabla de una column
ALTER TABLE factura
change column id_producto id_factura int not null;

CREATE TABLE detallefactura(
id_detalle int primary key not null,
cod_factura int not null,
cod_producto int not null,
cantidad int not null,
precio int not null,
subtotal int not null,
foreign key(cod_factura)references factura(id_factura),
foreign key(cod_producto)references producto(id_producto)
);
CREATE TABLE empleado(
id_empleado int primary key not null,
nombre varchar(50) not null,
apellido varchar(50) not null,
dirección varchar(100) not null,
teléfono varchar(10) not null,
email varchar(100) not null,
puesto varchar(100) not null
);
describe cliente;
select * from  cliente;
insert into cliente(id_cliente, nombre, apellido, dirección, teléfono, email)values
(1, 'Josue Daniel', 'Tombe Yalanda', 'Calle 123 #54-12', '3503560227', 'josuetombe@gmail.com'),
(2, 'Jaiver Alexander', 'Tombe Yalanda', 'Avenida 100 #126-21', '3043309169', 'jaiveryalanda@gmail.com'),
(3, 'Jonathan Tombe', 'Tombe Yalanda', 'carrera 98 #77-59', '3508887389', 'jonathantombe@gmail.com'),
(4, 'Maria Esperanza', 'Yalanda Yalanda', 'calle 134 #99-35', '9999999999', 'mariayalanda@gmail.com'),
(5, 'Manuel Jesus Tombe', 'Tombe Yalanda', 'Avenida 200 #156-45', '8888888888', 'Manueltombe@gmail.com');
select * from empleado;
insert into empleado(id_empleado, nombre, apellido, dirección, teléfono, email, puesto)values
(1, 'Juan Manuel', 'Perez Bolaños', 'Calle 150 #210-68', '9999999999','juanpb@gmail.com', 'Vijilante'),
(2, 'Maria Esperanza', 'Garcia Rodriguez', 'Avenida 98 #46-88', '8888888888', 'mariagr@gmail.com', 'Gerente'),
(3, 'Carlos Luiz ', 'Rodriguez Gonzales', 'Carrera 136 #126-56', '7777777777', 'carlosrg@gmail.com', 'Vendedor'),
(4, 'Ana Sofia', 'Gonzales Martines', 'Calle 177 #80-99', '6666666666', 'anasofia@gmail.com', 'Contador'),
(5, 'Laura Sofia', 'Hernades Lopez', 'Avenidad 178 #12-69', '5555555555', 'laurasofia@gmail.com', 'Secretaria');
select * from producto;
insert into producto(id_producto, nombre, descripción, precio, stock)values
(1, 'Espinaca', 'Espinaca fresca de la huerta', 2.000, 10),
(2, 'Tomate', 'Tomate fresco de la huerta', 4.000, 30),
(3, 'lechuga', 'Lechuga fresca de la huerta', 3.000, 5),
(4, 'Brocoli', 'Brocoli fresca de la huerta', 5.000, 20),
(5, 'Acelga', 'Acelga fresca de la huerta', 6.000, 15);
select * from factura;
insert into factura(id_factura, fecha_emision, total, metodo_pago, cod_cliente, cod_empleado) values
(1, '2023-08-20', 180.000, 'efectivo', 1, 1),
(2, '2023-08-19', 200.000, 'tarjeta', 2, 2),
(3, '2023-08-18', 150.00, 'efectivo', 3, 3),
(4, '2023-08-17', 300.000, 'tarjeta', 4, 4),
(5, '2023-08-16', 400.000, 'efectivo', 5, 5);
select * from detallefactura;
insert into detallefactura(id_detalle, cod_factura, cod_producto, cantidad, precio, subtotal)values
(1, '1', '1', '10', '2.000', '20.000'),
(2, '2', '2', '30', '4.000', '120.000'),
(3, '3', '3', '5', '3.000', '15.000'),
(4, '4', '4', '20', '5.000', '100.000'),
(5, '5', '5', '15', '6.000', '90.000');