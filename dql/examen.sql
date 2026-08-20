
delimiter //

create function fn_calcular_total_con_iva(
    p_id_pedido int
) 
returns decimal(10,2)
deterministic
reads sql data

begin
    
    declare v_total_sin_iva  decimal(10,2) default 0.00;

    -- obtener la suma de total_sin_iva:
    select coalesce(sum(total_sin_iva), 0)
    into v_total_sin_iva
    from detalle_pedido
    where id_pedido = p_id_pedido;

    
    -- aplicar iva 12%
    set v_total_sin_iva = v_total_sin_iva * 1.12;

    return round(v_total_sin_iva, 2);

end //

delimiter ;


DELIMITER //


-- vista_resumen_sedes

drop view if exists vista_resumen_sede;

create or replace view vista_resumen_pedidos_por_sede as 

select 
    s.id_sede,
    s.nombre_sede,
    s.ubicacion,

    count(p.id_pedido) as total_pedidos_despachados,

    coalesce(
            sum(p.total_sin_iva), 0.00
    ) as Valor_total_vendido

    from sedes as s

    left join pedidos p
        on s.id_sede = p.id_sede

    group by 
    s.id_sede,
    s.nombre_sede,
    s.ubicacion;


-- *************************************
-- consulta - subconsulta. 
-- *************************************

select 
p.nombre_producto,
p.categoria_producto,
count(precio_producto) as precio_unitario,
stock _actual as stock

from productos

;


create table auditoria_precios(

    id_auditoria int auto_increment primary key, 
    id_producto int not null,
    precio_anterior decimal(10,2) not null,
    precio_nuevo decimal(10,2) not null,
    fecha_cambio datetime not null default current_timestamp,

    
    foreign key (id_producto) references productos(id_productos)

);