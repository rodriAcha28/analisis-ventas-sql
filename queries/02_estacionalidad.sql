-- ============================================================
-- Q2: ¿Qué meses generan más ingresos?
-- Objetivo: Detectar estacionalidad para planificación operativa
-- Hallazgo: Oct-Nov concentra ~25-30% de ingresos anuales
--           consistentemente en ambos años analizados.
--           Nota: Dic 2011 muestra caída por corte del dataset
--           a mediados de mes, no por baja real en ventas.
-- ============================================================

SELECT
    EXTRACT(YEAR FROM invoicedate) AS anio,
    EXTRACT(MONTH FROM invoicedate) AS mes,
    ROUND(SUM(quantity * unitprice)::numeric, 2) AS ingresos
FROM retail_online
WHERE quantity > 0
GROUP BY anio, mes
ORDER BY anio, mes;
