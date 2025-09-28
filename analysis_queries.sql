/* 
Caso de estudio:  ANALISIS DE VENTAS (SQL WINDOW FUNCTIONS)                                                                                                                                

Objetivo: Evaluar el rendimiento mensual y global de vendedores

INDICADORES:

  Desempeño General y Ranking Global:

   ¿Cuál es el total de ventas por vendedor y qué puesto ocupa a nivel global?
   
       -Uso la agregación sum() para obtener las ventas de cada vendedor.
       -Uso Rank() para obtener el puesto que ocupa cada vendedor a nivel global.*/

	select 
	   vendedor,
	   sum(ventas) as ventas_vendedor,
	   rank() over (order by sum(ventas) desc) as Ranking_global
	from fun_ventanas2
	group by vendedor;
    
/* Análisis de Tendencias y Crecimiento

   ¿Cuánto vendió cada vendedor comparado con el mes anterior y cuál fue el crecimiento porcentual respecto al mes anterior?
   
          ## Uso LAG() para traer la venta anterior y calcular la diferencia.
          ## Uso Coalesce para manejar los valores NULL.*/
          
	select 
       vendedor,
	   mes, 
	   ventas,
	   coalesce(lag(ventas,1) over ( partition by vendedor order by mes), 0) as Venta_Mes_Anterior,
       coalesce (ventas - lag(ventas,1) over ( partition by vendedor order by mes),0) as Tendecia_Mensual,
	   coalesce (((ventas-lag(ventas,1) over ( partition by vendedor order by mes))/(lag(ventas,1) over ( partition by vendedor order by mes)))*100, 0) as Crecimiento_Porcentual
	from fun_ventanas2;
    

	/* Ranking mensual dentro de la región. En cada mes y región, ¿qué puesto ocupa cada vendedor según sus ventas?
          
          Uso Rank() para obtener el puesto que ocupa cada vendedor.*/
          
	select 
      vendedor,
	  mes,
	  region,
	  ventas,
	  rank() over ( partition by mes, region order by ventas desc ) as Ranking_Mensual
	from fun_ventanas2;

	/* Top ventas por región acumuladas. ¿Cuál es el acumulado de ventas por región, sumando mes a mes?
    
           ## Uso la clausula Over para convertir la función sum() de una simple agregación a una función de ventana.
           ## Uso La clausula Partition by porque divide las filas en grupos independientes (En este caso, en regiones), lo cual permite que la suma se reinicie al cambiar de región.
           ## Uso la clausula Order by porque permite que la suma sea acumulativa.*/
           
	select 
	   vendedor,
	   mes,
	   region,
	   ventas,
	   sum(ventas) over (partition by region order by mes asc) as Ven_Acum_Region
	from fun_ventanas2;

	

	