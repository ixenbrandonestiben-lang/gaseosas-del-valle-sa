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


delimiter //

create function fn_calcular_total_con_iva(
    p_id_pedido int
) 
returns decimal(10,2)
deterministic
reads sql data

begin

    declare v_total decimal(10,2) default 0.00;
    declare v_total_con_iva decimal(10,2) default 0.00;

    -- obtener la suma de las subtotales
    select coalesce(sum(subtotal), 0)
    into v_total_sin_iva
    from detalle_pedidos
    where id_pedido = p_id_pedido;

    -- aplicar iva 12%
    set v_total_con_iva = v_total_sin_iva * 1.12;

    return round(v_total_con_iva, 2);
end //

delimiter ;