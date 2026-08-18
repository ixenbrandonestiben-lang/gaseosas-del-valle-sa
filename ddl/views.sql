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

    p.id_productos,
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
    end as estado_stock,

    i.fecha_actualizacion
from inventario_sede i

inner join sedes s
    on i.id_sede = s.id_sede

inner join productos p
    on i.id_productos = p.id_productos

where i.stock_actual <= i.stock_minimo;

-- *********************************************
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


-- ============================================================
-- 7. VERIFICACIÓN DE VISTAS
-- ============================================================



/* ============================================================
   VISTA: vista_productos_bajo_stock
   ============================================================ */


DROP VIEW IF EXISTS vista_productos_bajo_stock;

CREATE VIEW vista_productos_bajo_stock AS

SELECT
    i.id_inventario,
    s.id_sede,
    s.nombre_sede,

    p.id_productos,
    p.nombre_producto,
    p.categoria_producto,

    i.stock_actual,
    i.stock_minimo,

    CASE
        WHEN i.stock_actual = 0
            THEN 'stock bajo'

        WHEN i.stock_actual <= i.stock_minimo
            THEN 'stock bajo'

        ELSE 'stock normal'
    END AS estado_stock,

    i.fecha_actualizacion

FROM inventario_sede i

INNER JOIN sedes s
    ON i.id_sede = s.id_sede

INNER JOIN productos p
    ON i.id_productos = p.id_productos

WHERE i.stock_actual <= i.stock_minimo;



SELECT *
FROM vista_resumen_pedidos_por_sede;


SELECT *
FROM vista_productos_bajo_stock;


SELECT *
FROM vista_cliente_activos;

/*
select * from vista_resumen_pedidos_por_sede;
*/