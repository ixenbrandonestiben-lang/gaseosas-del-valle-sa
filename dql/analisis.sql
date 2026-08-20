
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

