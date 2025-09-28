## Caso de Estudio: Análisis de Tendencias y Rendimiento de Ventas (SQL)
-Objetivo: Analizar el rendimiento de 3 vendedores a lo largo de 3 meses para identificar tendencias de crecimiento, ranking y acumulación de ventas.

## 🛠️ Metodología y Herramientas
SQL (Usando funciones de ventana)

## Conjunto de Datos:
Tabla simple con IdVenta, Vendedor, Mes, Región y Ventas.

## Funciones claves utilizadas: 
**Funciones de Ventana**:
 1. Lag(): Para comparar las ventas de un mes con el anterior.
 2. Rank(): Para determinar la posición de cada vendedor dentro de su región.
 3. Sum() Over(): Para calcular las ventas acumulados por región.
    
**Funciones de limpieza de datos**:
 1. Coalesce: Para trabajar con los valores Null.

## Conclusiones Claves y Recomendaciones del Negocio:

1. Desempeño General y Ranking Global:
   * Pedro es el mejor vendedor con rendimiento global de $5.900 en ventas.
   * Laura ocupa el segundo lugar mostrando un desempeño fuerte y consistente en la región Norte.
   * Ana tiene el menor volumen de ventas, lo que indica una necesidad de revisión y apoyo.
     
2. Analisis de Tendencias y Crecimiento:
   *Tendencia Marzo vs Febrero*
   
   * Pedro tuvo un crecimiento del **16.67%**  y sus ventas subieron $300. Muestra una tendencia positiva y constante. Pedro es el benchmark de la operación. Su crecimiento constante en la Región Sur sugiere la existencia de mejores prácticas que deben ser documentadas y escaladas al resto del equipo.
   * Laura tuvo un crecimiento del **6.25%** y sus ventas subieron $100. Tiene un crecimiento más moderado que Pedro, pero consistente en la región Norte. Esto sugiere una base de clientes estable.
   * Ana tuvo un crecimiento del **-25%** y sus ventas cayeron -$300. Ana experimentó una CAÍDA CRÍTICA del -25% en marzo. Esto es un cuello de botella de proceso que requiere una intervención inmediata e investigación de causa raíz (¿Inventario? ¿Capacitación? ¿Problemas de lead?)."

3. Dinamica Regional y Competitiva:

   **Region Norte**: Aunque tiene más vendedores (Ana y Laura), la región Sur (Pedro) tiene el vendedor con mayor volumen total. La acumulación de ventas es más alta en Norte, pero esto se debe a tener más recursos.

   **Ranking**: En la región Norte, Laura le gana consistentemente a Ana en todos los meses.

   **Perspectiva**: Sugerir una revisión de la distribución de territorios o una meta de crecimiento más ambiciosa para la región Sur, dado el alto rendimiento de Pedro.

## 💻 Consultas SQL Utilizadas






