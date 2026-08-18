use gaseosas_del_valle;

-- Consultar los productos con stock por debajo del mínimo.
select 
    s.nombre_sede,
    p.id_productos,
    p.nombre_producto,
    p.categoria_producto,
    i.stock_actual,
    i.stock_minimo,
    (i.stock_minimo -i.stock_actual) as unidades_faltantes

from inventario_sede i
inner join productos p
    on i.id_productos = p.id_productos
inner join sedes s
    on i.id_sede = s.id_sede
where i.stock_actual < i.stock_minimo
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
	p.id_productos,
    p.nombre_producto,
    p.categoria_producto,
    sum(dp.cantidad_producto) as cantidad_total_vendida,
    sum(dp.subtotal) as ventas_generadas

from detalle_pedido dp
inner join productos p
    on dp.id_producto = p.id_productos
inner join pedidos pe
    on dp.id_pedido = pe.id_pedido
where pe.estado_pedido <> 'Cancelado'
group by 
    p.id_productos,
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
select
    id_productos,
    nombre_producto,
    categoria_producto,
    precio_producto,
    volumen_producto_ml,
    estado_producto
from productos
where categoria_producto in
(
    'Cola',
    'Cola Zero',
    'Naranja',
    'Agua'
)
order by categoria_producto, nombre_producto;


-- Mostrar el cliente con mayor número de pedidos (subconsulta).
select
    c.id_cliente,
    c.nombre_completo_cliente,
    count(p.id_pedido) as cantidad_pedidos
from clientes c
inner join pedidos p
    on c.id_cliente = p.id_cliente
group by
    c.id_cliente,
    c.nombre_completo_cliente
having count(p.id_pedido) =
(
    select max(cantidad_pedidos)
    from
    (
        select
            count(id_pedido) as cantidad_pedidos
        from pedidos
        group by id_cliente
    ) as resumen_clientes
);


-- Consultar pedidos y sus totales agrupados por sede.
select
    s.id_sede,
    s.nombre_sede,
    count(
        case
            when p.estado_pedido <> 'cancelado'
            then p.id_pedido
        end
    ) as cantidad_pedidos,

    coalesce(
        sum(
            case
                when p.estado_pedido <> 'cancelado'
                then p.total_sin_iva
                else 0
            end
        ),
        0.00
    ) as total_ventas_sin_iva,

    coalesce(
        sum(
            case
                when p.estado_pedido <> 'cancelado'
                then p.total_con_iva
                else 0
            end
        ),
        0.00
    ) as total_ventas_con_iva

from sedes s
left join pedidos p
    on s.id_sede = p.id_sede
group by
    s.id_sede,
    s.nombre_sede
order by total_ventas_con_iva desc;



use gaseosas_del_valle;


-- Ver estructura del log de stock
DESCRIBE log_stock_critico;

/*
use gaseosas_del_valle;

insert into clientes(nombre_completo_cliente, identificacion_cliente, direccion_cliente, telefono_cliente, correo_electronico_cliente, estado_cliente)
values ('carlos pérez', '123456', 'zona 1', '555-1234', 'carlos@mail.com', 'activo');

select * from clientes 
order by id_cliente desc;*/

/*select p.nombre_producto, sum(dp.cantidad_producto) as vendidos
from detalle_pedido dp
inner join productos p on dp.id_producto = p.id_productos
group by p.nombre_producto
order by vendidos desc;
*/