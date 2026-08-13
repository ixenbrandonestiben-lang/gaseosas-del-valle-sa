use gaseosas_del_valle;

drop function if exists fn_calcular_total_con_iva;
drop function if exists fn_validar_stock;

create table if not exists log_stock_critico(
    id_log_stock_critico int auto_increment primary key,
    id_sede int not null,
    id_producto int not null,
    stock_actual int not null,
    stock_minimo int not null,
    procentaje_stock_actual float not null,
    fecha_deteccion datetime not null default current_timestamp,
    estado_log enum('pendiente','resuelto') not null default 'pendiente'

    foreign key (id_sede) references sedes(id_sede) on delete cascade,
    foreign key (id_producto) references productos(id_producto) on delete cascade
);


delimiter //

create function fn_calcular_total_con_iva(
    p_id_pedido int
) 
returns decimal(10,2)
deterministic
reads sql data

begin

    declare v_total decimal(10,2) default 0.00;
    declare v_total_con_iva decimal(10,2) default 0.00;

    -- obtener la suma de las subtotales
    select coalesce(sum(subtotal), 0)
    into v_total_sin_iva
    from detalle_pedidos
    where id_pedido = p_id_pedido;

    -- aplicar iva 12%
    set v_total_con_iva = v_total_sin_iva * 1.12;

    return round(v_total_con_iva, 2);
end //

delimiter ;


DELIMITER //

CREATE FUNCTION fn_validar_stock(
    p_id_sede INT,
    p_id_producto INT,
    p_cantidad INT
)
RETURNS VARCHAR(100)
DETERMINISTIC
READS SQL DATA
BEGIN

    DECLARE v_stock_actual INT DEFAULT NULL;

    -- Validar cantidad solicitada
    IF p_cantidad <= 0 THEN
        RETURN 'CANTIDAD INVALIDA';
    END IF;

    -- Buscar stock de la sede y producto
    SELECT stock_actual
    INTO v_stock_actual
    FROM inventario_sede
    WHERE id_sede = p_id_sede
      AND id_producto = p_id_producto
    LIMIT 1;

    -- Producto no registrado en esa sede
    IF v_stock_actual IS NULL THEN
        RETURN 'PRODUCTO NO REGISTRADO EN LA SEDE';
    END IF;

    -- Validar existencia
    IF v_stock_actual >= p_cantidad THEN
        RETURN CONCAT(
            'STOCK SUFICIENTE - DISPONIBLE: ',
            v_stock_actual
        );
    ELSE
        RETURN CONCAT(
            'STOCK INSUFICIENTE - DISPONIBLE: ',
            v_stock_actual,
            ' - SOLICITADO: ',
            p_cantidad
        );
    END IF;

END //

DELIMITER ;
