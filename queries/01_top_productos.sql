-- ============================================================
-- Q1: ¿Cuáles son los 10 productos más vendidos?
-- Objetivo: Identificar productos líderes en unidades e ingresos
-- Hallazgo: El producto con más unidades (GLIDERS, 110K) genera
--           10x menos ingresos que el líder en revenue.
-- ============================================================

SELECT
    description AS producto,
    SUM(quantity) AS unidades_vendidas,
    ROUND(SUM(quantity * unitprice)::numeric, 2) AS ingresos_totales
FROM retail_online
WHERE quantity > 0
    AND description IS NOT NULL
GROUP BY description
ORDER BY unidades_vendidas DESC
LIMIT 10;
