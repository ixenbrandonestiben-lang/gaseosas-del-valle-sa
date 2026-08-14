use gaseosas_del_valle;

DROP EVENT IF EXISTS evt_limpiar_auditorias_antiguas;
DROP EVENT IF EXISTS evt_notificar_stock_critico;


DELIMITER //

CREATE EVENT evt_limpiar_auditorias_antiguas

ON SCHEDULE
    EVERY 1 MONTH
    STARTS CURRENT_TIMESTAMP + INTERVAL 1 MONTH

DO
BEGIN

    DELETE FROM auditoria_precios
    WHERE fecha_cambio < DATE_SUB(
        CURRENT_TIMESTAMP,
        INTERVAL 1 YEAR
    );

END //


DELIMITER //

CREATE EVENT evt_notificar_stock_critico

ON SCHEDULE
    EVERY 1 DAY
    STARTS CURRENT_TIMESTAMP + INTERVAL 1 DAY

DO
BEGIN

    INSERT INTO log_stock_critico (
        id_sede,
        id_producto,
        stock_actual,
        stock_minimo,
        porcentaje_stock,
        fecha_deteccion,
        estado_log
    )

    SELECT

        i.id_sede,
        i.id_producto,
        i.stock_actual,
        i.stock_minimo,

        ROUND(
            (i.stock_actual / NULLIF(i.stock_minimo, 0)) * 100,
            2
        ) AS porcentaje_stock,

        CURRENT_TIMESTAMP,
        'detectado'

    FROM inventario_sede i

    WHERE i.stock_minimo > 0

      AND i.stock_actual <
          (i.stock_minimo * 0.50)

      AND NOT EXISTS (

          SELECT 1

          FROM log_stock_critico l

          WHERE l.id_sede = i.id_sede
            AND l.id_producto = i.id_producto
            AND DATE(l.fecha_deteccion) =
                CURRENT_DATE

      );

END //

DELIMITER ;
