-- Ejercicio 2.b
-- Tobias Llop

WITH lineas_distintas AS (
  SELECT DISTINCT g.barrio_nombre, l.nombre_linea
  FROM fact_viajes_agreg AS f
  INNER JOIN dim_linea_empresa AS l ON f.id_linea = l.id_linea
  INNER JOIN dim_geo_grilla AS g ON f.id_grilla = g.id_grilla
  WHERE f.cant_trx > 0 AND (g.barrio_nombre = 'AREACENTRO' OR g.barrio_nombre = 'ESTACION TERMINAL' OR g.barrio_nombre = 'PLAYA CHAPADMALAL')
)
SELECT 
  barrio_nombre,
  COUNT(nombre_linea) AS cant_lineas_transp,
  STRING_AGG(nombre_linea, ', ' ORDER BY nombre_linea) AS lista_lineas_transp
FROM lineas_distintas
GROUP BY barrio_nombre;
