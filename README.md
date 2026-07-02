## Análisis de Ventas E-Commerce UK · SQL + PostgreSQL

Análisis exploratorio de más de **1 millón de transacciones reales** de un e-commerce del Reino Unido (2009–2011), con el objetivo de identificar patrones de ventas, comportamiento de clientes y oportunidades de mercado internacional.


## Estructura del repositorio

analisis-ventas-sql/
│
├── queries/
│   ├── 01_top_productos.sql
│   ├── 02_estacionalidad.sql
│   ├── 03_ventas_por_pais.sql
│   ├── 04_recurrencia_clientes.sql
│   ├── 05_tasa_devoluciones.sql
│   └── 06_ticket_promedio.sql
│
├── dashboard.html          ← Dashboard visual con los resultados
└── README.md
```

---

## Herramientas utilizadas

| Herramienta | Uso |
|---|---|
| PostgreSQL | Base de datos |
| pgAdmin 4 | Ejecución de queries |
| HTML + Chart.js | Dashboard de resultados |

---

## Dataset

**Online Retail II** · UCI Machine Learning Repository  
- Período: Diciembre 2009 – Diciembre 2011  
- Registros: ~1,067,371 transacciones  
- Fuente: https://archive.ics.uci.edu/dataset/502/online+retail+ii

### Columnas principales

| Columna | Descripción |
|---|---|
| `invoiceno` | ID de factura. Empieza con 'C' si es cancelación |
| `stockcode` | Código de producto |
| `description` | Nombre del producto |
| `quantity` | Unidades por transacción |
| `invoicedate` | Fecha y hora de la transacción |
| `unitprice` | Precio unitario en libras esterlinas (£) |
| `customerid` | ID único del cliente |
| `country` | País del cliente |

---

## Preguntas de negocio respondidas

### 1 · ¿Cuáles son los 10 productos más vendidos?

**Hallazgo:** El producto más vendido en unidades (WORLD WAR 2 GLIDERS, 110K unidades) genera solo £25K en ingresos — 10 veces menos que el líder en revenue (WHITE HANGING HEART, £266K). Optimizar solo por volumen puede priorizar los productos menos rentables.

### 2 · ¿Qué meses generan más ingresos?

**Hallazgo:** Existe estacionalidad clara y consistente: octubre–noviembre concentra el 25–30% de ingresos anuales en ambos años. Noviembre 2011 fue el mes pico con £1.5M. Diciembre 2011 muestra una caída aparente que se explica por el corte del dataset a mediados de mes, no por una baja real en ventas.

### 3 · ¿Qué mercados internacionales generan más ingresos?

**Hallazgo:** Irlanda lidera en ingresos totales (£664K) pero Países Bajos genera £554K con solo 229 órdenes vs 626 de Irlanda. Esto indica un ticket promedio mucho más alto en Países Bajos, posiblemente por clientes mayoristas.

### 4 · ¿Cuántos clientes son recurrentes vs únicos?

**Hallazgo:** El 72.3% de los clientes compra más de una vez (41.7% recurrente + 30.6% frecuente). Solo el 27.6% es de única compra — tasa de retención muy alta para e-commerce, consistente con una base de clientes B2B o distribuidores.

### 5 · ¿Qué tasa de devoluciones tiene el negocio?

**Hallazgo:** Solo el 1.83% de los registros son cancelaciones, muy por debajo del promedio del sector retail (20–30%). Esto refuerza la hipótesis de una base de clientes B2B con compras más planificadas y menos impulsivas.

### 6 · ¿Cuánto gasta en promedio un cliente por país?

**Hallazgo:** El gasto promedio por cliente en Irlanda (£124K) es 30 veces mayor que en Alemania (£4K). Esta diferencia extrema confirma la presencia de distribuidores mayoristas que distorsionan los promedios. Segmentar B2B de B2C sería el análisis siguiente natural.

---

## Conclusiones generales

1. **Estacionalidad marcada:** Respuesta 4 (especialmente noviembre) es crítico para la operación. La planificación de inventario y logística debería orientarse hacia ese período.

2. **Alta fidelización:** Con 72% de clientes recurrentes, el negocio tiene una base sólida. El foco debería estar en retención, no en adquisición masiva.

3. **Heterogeneidad en mercados internacionales:** El análisis por país sin segmentar B2B/B2C lleva a conclusiones distorsionadas. Un análisis más profundo requeriría identificar qué clientes son distribuidores.

4. **Ingresos ≠ Volumen:** Hay productos de alto volumen pero bajo margen (como GLIDERS) y productos de bajo volumen pero alto margen. Una estrategia de producto debería priorizar el segundo grupo.

---

## Cómo reproducir el análisis

1. Descargar el dataset: https://archive.ics.uci.edu/dataset/502/online+retail+ii
2. Convertir el archivo `.xlsx` a `.csv`
3. Importar el CSV en PostgreSQL como tabla `retail_online`
4. Ejecutar las queries en la carpeta `/queries/` en orden numérico
5. Abrir `dashboard.html` en el navegador para visualizar los resultados

---

## Próximos pasos

- Separar clientes B2B de B2C usando umbrales de gasto y frecuencia
- Análisis RFM (Recency, Frequency, Monetary) para segmentación avanzada
- Modelo de predicción de churn con Python + scikit-learn

---

*Dataset: Online Retail II · UCI Machine Learning Repository · Donado por el Dr. Daqing Chen, London South Bank University*
