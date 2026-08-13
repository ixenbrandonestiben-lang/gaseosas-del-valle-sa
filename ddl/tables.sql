DROP DATABASE IF EXISTS gaseosas_del_valle;
CREATE DATABASE gaseosas_del_valle;
USE gaseosas_del_valle;

create table clientes(
    id_cliente int primary key auto_increment,
    nombre_completo_cliente varchar(100) not null,
    identificacion_cliente varchar(20) not null,
    direccion_cliente varchar(100) not null,
    telefono_cliente varchar(20) not null,
    correo_electronico_cliente varchar(100) not null,
    estado_cliente varchar(20) not null
);

create table productos(
    id_productos int primary key auto_increment,
    nombre_producto varchar(100) not null,
    categoria_producto varchar(50) not null,
    precio_producto decimal(10,2) not null,
    volumen_producto_ml decimal(10,2) not null,
    estado_producto varchar(20) not null
);

create table sedes(
    id_sede int primary key auto_increment,
    nombre_sede varchar(100) not null,
    ubicacion varchar(100) not null,
    capacidad_almacenamiento int not null check (capacidad_almacenamiento > 0),
    encargado_sede varchar(100) not null,
    estado_sede enum('Activa', 'Inactiva') not null default 'Activa'
);

create table inventario_sede(
    id_inventario int auto_increment primary key,
    id_sede int not null,
    id_productos int not null,
    stock_actual int not null check (stock_actual >= 0),
    stock_minimo int not null check (stock_minimo >= 0),
    fecha_actualizacion timestamp default current_timestamp on update current_timestamp
);

