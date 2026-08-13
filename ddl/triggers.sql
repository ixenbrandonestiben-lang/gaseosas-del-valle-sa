use gaseosas_del_valle;

drop trigger if exists tr_actualizar_stock;
drop trigger if exists tr_auditar_cambio_precio;

create trigger tr_actualizar_stock
before insert on detalle_pedido
for each row

begin

    declare v_id_sede int default null;
    declare v_stock_actual int default null;

    -- obtener la sede correspondiente al pedido

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
      AND id_producto = NEW.id_producto
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
      AND id_producto = NEW.id_producto;

END //

DELIMITER ;
CREATE TRIGGER tr_auditar_cambio_precio
AFTER UPDATE ON productos
FOR EACH ROW
BEGIN

    IF OLD.precio_producto <> NEW.precio_producto THEN

        INSERT INTO auditoria_precios (
            id_producto,
            precio_anterior,
            precio_nuevo,
            fecha_cambio,
            usuario_cambio
        )
        VALUES (
            NEW.id_producto,
            OLD.precio_producto,
            NEW.precio_producto,
            CURRENT_TIMESTAMP,
            COALESCE(NEW.usuario_registro, 'ADMIN')
        );

    END IF;

END //

DELIMITER ;
