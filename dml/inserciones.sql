use gaseosas_del_valle;

drop function if exists fn_calcular_total_con_iva;
drop function if exists fn_validar_stock;

create table if not exists log_stock_critico(
    id_log_stock_critico int auto_increment primary key,
    id_sede int not null,
    id_producto int not null,
    stock_actual int not null,
    stock_minimo int not null,
    procentaje_stock_actual float not null,
    fecha_deteccion datetime not null default current_timestamp,
    estado_log enum('pendiente','resuelto') not null default 'pendiente'

    foreign key (id_sede) references sedes(id_sede) on delete cascade,
    foreign key (id_producto) references productos(id_producto) on delete cascade
);

