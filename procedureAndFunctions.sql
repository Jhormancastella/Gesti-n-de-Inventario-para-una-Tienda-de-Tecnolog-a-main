-- Función almacenada para registrar una venta
CREATE OR REPLACE FUNCTION registrar_venta(
    p_id_cliente INT,
    p_productos INT[],       -- Lista de IDs de productos
    p_cantidades INT[]       -- Lista de cantidades correspondientes
) RETURNS VOID AS $$
DECLARE
    i INT;
    v_stock_actual INT;
    v_id_venta INT;
BEGIN
    -- Transacción segura
    BEGIN

        -- Validar que el cliente exista
        IF NOT EXISTS (
            SELECT 1 FROM clientes WHERE id_cliente = p_id_cliente
        ) THEN
            RAISE EXCEPTION 'El cliente con ID % no existe.', p_id_cliente;
        END IF;

        -- Validar que la longitud de los arrays coincida
        IF array_length(p_productos, 1) IS DISTINCT FROM array_length(p_cantidades, 1) THEN
            RAISE EXCEPTION 'Los arrays de productos y cantidades no tienen la misma longitud.';
        END IF;

        -- Validar que haya al menos un producto
        IF array_length(p_productos, 1) IS NULL THEN
            RAISE EXCEPTION ' La venta debe incluir al menos un producto.';
        END IF;

        -- Verificar stock disponible para cada producto
        FOR i IN 1..array_length(p_productos, 1) LOOP
            SELECT stock INTO v_stock_actual
            FROM productos
            WHERE id_producto = p_productos[i];

            IF NOT FOUND THEN
                RAISE EXCEPTION 'El producto con ID % no existe.', p_productos[i];
            END IF;

            IF v_stock_actual < p_cantidades[i] THEN
                RAISE EXCEPTION 'Stock insuficiente para el producto ID %: disponible %, requerido %.',
                    p_productos[i], v_stock_actual, p_cantidades[i];
            END IF;
        END LOOP;

        -- Registrar venta en tabla "ventas"
        INSERT INTO ventas (id_cliente, fecha)
        VALUES (p_id_cliente, CURRENT_DATE)
        RETURNING id_venta INTO v_id_venta;

        -- Registrar detalles y actualizar stock
        FOR i IN 1..array_length(p_productos, 1) LOOP
            INSERT INTO detalle_ventas (id_venta, id_producto, cantidad, precio_unitario)
            VALUES (
                v_id_venta,
                p_productos[i],
                p_cantidades[i],
                (SELECT precio FROM productos WHERE id_producto = p_productos[i])
            );

            UPDATE productos
            SET stock = stock - p_cantidades[i]
            WHERE id_producto = p_productos[i];
        END LOOP;

        -- Confirmación
        RAISE NOTICE ' Venta registrada correctamente con ID %', v_id_venta;

        COMMIT;

    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE NOTICE ' Error durante el registro de la venta: %', SQLERRM;
            RAISE;
    END;
END;
$$ LANGUAGE plpgsql;
