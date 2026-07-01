-- ============================================================
-- Q5: ¿Qué tasa de devoluciones tiene el negocio?
-- Objetivo: Evaluar salud operativa del e-commerce
-- Hallazgo: Solo 1.83% de registros son cancelaciones.
--           Muy por debajo del promedio del sector (20-30%).
--           Refuerza hipótesis de base de clientes B2B.
-- Nota: Las cancelaciones se identifican por InvoiceNo
--       que comienza con la letra 'C' (según documentación UCI).
-- ============================================================

SELECT
    CASE
        WHEN invoiceno LIKE 'C%' THEN 'Devolución'
        ELSE 'Venta normal'
    END AS tipo,
    COUNT(*) AS registros,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM retail_online), 2) AS porcentaje
FROM retail_online
GROUP BY tipo;
