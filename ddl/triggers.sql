use gaseosas_del_valle;

DROP TRIGGER IF EXISTS tr_actualizar_stock;
DROP TRIGGER IF EXISTS tr_auditar_cambio_precio;

DELIMITER //

CREATE TRIGGER tr_actualizar_stock
BEFORE INSERT ON detalle_pedido
FOR EACH ROW
BEGIN

    DECLARE v_id_sede INT DEFAULT NULL;
    DECLARE v_stock_actual INT DEFAULT NULL;

    -- Obtener la sede correspondiente al pedido
    SELECT id_sede
    INTO v_id_sede
    FROM pedidos
    WHERE id_pedido = NEW.id_pedido
    LIMIT 1;

    -- Validar que el pedido exista
    IF v_id_sede IS NULL THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'ERROR: El pedido no existe o no tiene una sede asociada.';

    END IF;

    -- Obtener el stock actual
    SELECT stock_actual
    INTO v_stock_actual
    FROM inventario_sede
    WHERE id_sede = v_id_sede
      AND id_productos = NEW.id_producto
    LIMIT 1;

    -- Validar existencia del producto en la sede
    IF v_stock_actual IS NULL THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'ERROR: El producto no posee inventario registrado en la sede del pedido.';

    END IF;

    -- Validar stock disponible
    IF v_stock_actual < NEW.cantidad_producto THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'ERROR: Stock insuficiente para completar el pedido.';

    END IF;

    -- Descontar inventario
    UPDATE inventario_sede
    SET stock_actual = stock_actual - NEW.cantidad_producto
    WHERE id_sede = v_id_sede
      AND id_productos = NEW.id_producto;

END //


DELIMITER ;

DROP TRIGGER IF EXISTS tr_auditar_cambio_precio;

DELIMITER //

CREATE TRIGGER tr_auditar_cambio_precio
AFTER UPDATE ON productos
FOR EACH ROW
BEGIN

    IF OLD.precio_producto <> NEW.precio_producto THEN

        INSERT INTO auditoria_precios (
            id_producto,
            precio_anterior,
            precio_nuevo,
            fecha_cambio
        )
        VALUES (
            NEW.id_productos,
            OLD.precio_producto,
            NEW.precio_producto,
            CURRENT_TIMESTAMP
        );

    END IF;

END //

DELIMITER ;

-- **********************************************************
-- trigger
-- **********************************************************


-- primero consultar el inventario del producto 1 en la sede 1

SELECT
    i.id_inventario,
    i.id_sede,
    i.id_productos,
    p.nombre_producto,
    i.stock_actual,
    i.stock_minimo
FROM inventario_sede i
INNER JOIN productos p
    ON i.id_productos = p.id_productos
WHERE i.id_sede = 1
  AND i.id_productos = 1;
  
-- Ver triggers
SHOW TRIGGERS
FROM gaseosas_del_valle;

-- **************************
SELECT stock_actual
FROM inventario_sede
WHERE id_sede = 1
  AND id_productos = 1;
  
-- insertar 10 unidades de un pedido existente.

INSERT INTO detalle_pedido
(id_pedido, id_producto, cantidad_producto, precio_unitario, subtotal)
VALUES
(1, 1, 10, 10.00, 100.00);

-- comprovar que se hayan eliminado los productos
SELECT
    id_sede,
    id_productos,
    stock_actual
FROM inventario_sede
WHERE id_sede = 1
  AND id_productos = 1;

/*

-- ejermplo de trigger.
update productos
set precio_producto = 14.00
where id_productos = 1;

select * from productos
where id_productos = 1
order by id_productos desc;*/