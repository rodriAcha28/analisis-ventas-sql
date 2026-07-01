-- ============================================================
-- Q3: ¿Qué mercados internacionales generan más ingresos?
-- Objetivo: Identificar oportunidades de expansión fuera de UK
-- Hallazgo: Irlanda lidera en total (£664K) pero Países Bajos
--           genera £554K con solo 229 órdenes vs 626 de Irlanda,
--           indicando tickets mucho más altos (posible B2B).
-- ============================================================

SELECT
    country AS pais,
    COUNT(DISTINCT invoiceno) AS ordenes,
    ROUND(SUM(quantity * unitprice)::numeric, 2) AS ingresos_totales
FROM retail_online
WHERE quantity > 0
    AND country != 'United Kingdom'
GROUP BY country
ORDER BY ingresos_totales DESC
LIMIT 10;
