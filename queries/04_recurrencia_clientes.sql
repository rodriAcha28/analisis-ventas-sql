-- ============================================================
-- Q4: ¿Cuántos clientes son recurrentes vs únicos?
-- Objetivo: Medir fidelización de la base de clientes
-- Hallazgo: 72.3% de clientes compra más de una vez.
--           Alta tasa para e-commerce, posible base B2B.
-- ============================================================

SELECT
    CASE
        WHEN num_ordenes = 1 THEN 'Única compra'
        WHEN num_ordenes BETWEEN 2 AND 5 THEN 'Recurrente (2-5)'
        ELSE 'Cliente frecuente (6+)'
    END AS segmento,
    COUNT(*) AS clientes,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 1) AS porcentaje
FROM (
    SELECT customerid, COUNT(DISTINCT invoiceno) AS num_ordenes
    FROM retail_online
    WHERE customerid IS NOT NULL
        AND quantity > 0
    GROUP BY customerid
) sub
GROUP BY segmento
ORDER BY clientes DESC;
