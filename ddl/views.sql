use gaseosas_del_valle;

drop view if exists vista_resumen_pedidos_por_sede;
drop view if exists vista_productos_bajo_stock;
drop view if exists vista_clientes_activos;

-- ***************************************

create or replace view vista_resumen_pedidos_por_sede as 

select 
    s.id_sede,
    s.nombre_sede,
    s.ubicacion,

    count(p.id_pedido) as total_pedidos,

    coalesce(
            sum(p.total_con_iva), 0.00
    ) as ventas_acumuladas

    from sedes as s

    left join pedidos p
        on s.id_sede = p.id_sede

    group by 
    s.id_sede,
    s.nombre_sede,
    s.ubicacion;


-- ********************************************************

create or replace view vista_productos_bajo_stock as 

select 
    i.id_inventario,
    s.id_sede,
    s.nombre_sede,

    p.id_producto,
    p.nombre_producto,
    p.categoria_producto,

    i.stock_actual,
    i.stock_minimo,

    case
        when i.stock_actual = 0
            then 'stock bajo'

        when i.stock_actual <= i.stock_minimo
            then 'stock bajo'

        else 'stock normal'
    end as estado stock,

    i.fecha_actualizacion
from inventario_sede i

inner join sedes s
    on i.id_sede = s.id_sede

inner join productos p
    on i.id_producto = p.id_producto

where i.stock_actual <= i.stock_minimo;

-- *********************************************

create or replace view vista_cliente_activos as

select distinct

    c.id_cliente,
    c.nombre_completo_cliente,
    c.identificacion_cliente,
    c.direccion_cliente,
    c.telefono_cliente,
    c.correo_electronico_cliente,
    c.estado_cliente

from clientes c

inner join pedidos p
    on c.id_cliente = p.id_cliente

where c.estado_cliente = 'activo';