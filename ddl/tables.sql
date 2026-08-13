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

