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
