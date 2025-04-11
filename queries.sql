-- 1. Listar los productos con stock menor a 5 unidades.

SELECT id_producto, nombre, stock
FROM productos
WHERE stock < 5;

-- 2. Calcular ventas totales de un mes específico.

SELECT 
    TO_CHAR(v.fecha, 'TMMonth YYYY') AS mes,
    SUM(dv.cantidad * dv.precio_unitario) AS total_ventas
FROM ventas v
JOIN detalle_ventas dv ON v.id_venta = dv.id_venta
WHERE EXTRACT(MONTH FROM v.fecha) = 04
  AND EXTRACT(YEAR FROM v.fecha) = 2025
GROUP BY mes
ORDER BY total_ventas DESC;

-- 3. Obtener el cliente con más compras realizadas.

SELECT c.id_cliente, c.nombre, COUNT(v.id_venta) AS total_compras
FROM clientes c
JOIN ventas v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente
ORDER BY total_compras DESC
LIMIT 1;

-- 4. Listar los 5 productos más vendidos.

SELECT p.id_producto, p.nombre, SUM(dv.cantidad) AS total_vendido
FROM productos p
JOIN detalle_ventas dv ON p.id_producto = dv.id_producto
GROUP BY p.id_producto
ORDER BY total_vendido DESC
LIMIT 5;

-- 5. Consultar ventas realizadas en un rango de fechas de tres días y un mes.

SELECT v.id_venta, v.fecha, c.nombre AS cliente, SUM(dv.cantidad * dv.precio_unitario) AS total
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN detalle_ventas dv ON v.id_venta = dv.id_venta
WHERE v.fecha::date BETWEEN '2024-04-05' AND '2024-04-07'
GROUP BY v.id_venta, v.fecha, c.nombre;

-- 6. Identificar clientes que no han comprado en los últimos 6 meses.

SELECT c.id_cliente, c.nombre, c.correo
FROM clientes c
LEFT JOIN (
    SELECT id_cliente
    FROM ventas
    WHERE fecha >= CURRENT_DATE - INTERVAL '6 months'
    GROUP BY id_cliente
) recientes ON c.id_cliente = recientes.id_cliente
WHERE recientes.id_cliente IS NULL;