-- Consultar los productos con stock por debajo del mínimo.
select 
    s.nombre_sede,
    p.id_producto,
    p.nombre_producto,
    p.categoria_producto,
    i.stock_actual,
    i.stock_minimo,
    (i.stock_minimo -i.stock_actual) as unidades_faltantes

from inventario_sede i
inner join productos p
    on i.id_producto = p.id_producto
inner join sedes s
    on i.id_sede = s.id_sede
where i-stock_actual < i.stock_minimo
order by i.stock_actual asc;


-- Consultar los pedidos realizados entre dos fechas (BETWEEN).
select 
    p.id_pedido,
    p.fecha_pedido,
    p.id_cliente,
    p.id_sede,
    p.total_sin_iva,
    p.total_con_iva,
    p.estado_pedido
from pedidos p
where date (p.fecha_pedido)
    between '2026-01-01' and '2026-12-31'
order by p.fecha_pedido asc;

-- Listar los productos más vendidos (con JOIN y GROUP BY).

select
     p.id_producto,
    p.nombre_producto,
    p.categoria_producto,
    sum(dp.cantidad_producto) as cantidad_total_vendida,
    sum(dp.subtotal) as ventas_generadas

from detalle_pedido dp
inner join productos p
    on dp.id_producto = p.id_producto
inner join pedidos pe
    on dp.id_pedido = pe-id_pedido
where pe.estado_pedido <> 'cancelado'
group by 
    p.id_producto,
    p.nombre_producto,
    p.categoria_producto
order by cantidad_total_vendida desc;

-- Mostrar clientes y la cantidad de pedidos realizados.
select
    c.id_cliente,
    c.nombre_completo_cliente,
    c.identificacion_cliente,
    count(p.id_pedido) as cantidad_pedidos
from clientes c
left join pedidos p
    on c.id_cliente = p.id_cliente
group by
    c.id_cliente,
    c.nombre_completo_cliente,
    c.identificacion_cliente
order by cantidad_pedidos desc;


-- Buscar clientes por nombre parcial usando LIKE.
select
    id_cliente,
    nombre_completo_cliente,
    identificacion_cliente,
    direccion_cliente,
    telefono_cliente,
    correo_electronico_cliente,
    estado_cliente
from clientes
where nombre_completo_cliente like '%Carlos%'
order by nombre_completo_cliente asc;


-- Consultar productos de ciertas categorías usando IN.


-- Mostrar el cliente con mayor número de pedidos (subconsulta).


-- Consultar pedidos y sus totales agrupados por sede.




-- Ver funciones
SHOW FUNCTION STATUS
WHERE Db = 'gaseosas_del_valle';


-- Ver triggers
SHOW TRIGGERS
FROM gaseosas_del_valle;


-- Ver vistas
SHOW FULL TABLES
FROM gaseosas_del_valle
WHERE TABLE_TYPE = 'VIEW';


-- Ver eventos
SHOW EVENTS
FROM gaseosas_del_valle;


-- Ver estructura del log de stock
DESCRIBE log_stock_critico;



-- ============================================================
-- 6. VERIFICACIÓN DE FUNCIONES
-- ============================================================

-- Calcular total real del pedido 1
SELECT
    fn_calcular_total_con_iva(1) AS total_calculado;


-- Validar stock del producto 1 en la sede 1
SELECT
    fn_validar_stock(1, 1, 10) AS resultado_stock;


-- Validar una cantidad superior al stock disponible
SELECT
    fn_validar_stock(1, 1, 1000) AS resultado_stock;


-- ============================================================
-- 7. VERIFICACIÓN DE VISTAS
-- ============================================================

SELECT *
FROM vista_resumen_pedidos_por_sede;


SELECT *
FROM vista_productos_bajo_stock;


SELECT *
FROM vista_clientes_activos;


-- ============================================================
-- 8. VERIFICACIÓN DEL SISTEMA DE EVENTOS
-- ============================================================

-- Verificar eventos creados
SHOW EVENTS
FROM gaseosas_del_valle;


-- Verificar si el programador de eventos de MySQL está activo
SHOW VARIABLES LIKE 'event_scheduler';


-- ============================================================
-- 9. VERIFICACIÓN DE TRIGGERS
-- ============================================================

SHOW TRIGGERS
FROM gaseosas_del_valle;
