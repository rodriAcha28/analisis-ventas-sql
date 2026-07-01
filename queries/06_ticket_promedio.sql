-- ============================================================
-- Q6: ¿Cuánto gasta en promedio un cliente por país?
-- Objetivo: Identificar mercados de alto valor por cliente
-- Hallazgo: Irlanda (£124K/cliente) vs Alemania (£4K/cliente).
--           Diferencia de 30x sugiere distribuidores mayoristas
--           en Irlanda que distorsionan el promedio.
--           Próximo paso: separar segmento B2B de B2C.
-- ============================================================

SELECT
    country AS pais,
    COUNT(DISTINCT customerid) AS clientes_unicos,
    ROUND((SUM(quantity * unitprice) / COUNT(DISTINCT customerid))::numeric, 2) AS gasto_promedio_por_cliente
FROM retail_online
WHERE quantity > 0
    AND customerid IS NOT NULL
GROUP BY country
HAVING COUNT(DISTINCT customerid) >= 5
ORDER BY gasto_promedio_por_cliente DESC
LIMIT 10;
