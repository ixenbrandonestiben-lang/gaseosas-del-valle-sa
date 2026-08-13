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
