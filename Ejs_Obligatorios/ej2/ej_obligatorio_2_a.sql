-- Ejercicio 2.a
-- Tobias Llop

SELECT f.cant_trx, g.zona_interes_750m
FROM fact_viajes_agreg AS f 
INNER JOIN dim_geo_grilla AS g ON f.id_grilla=g.id_grilla
INNER JOIN dim_linea_empresa AS l ON f.id_linea=l.id_linea
INNER JOIN dim_tipo_tarifa AS t ON f.id_tipo_tarifa = t.id_tipo_tarifa
WHERE l.nombre_empresa = 'TRANSPORTES 25 DE MAYO SRL' AND f.hora = 12 AND t.descripcion = 'BONIFICADA'
GROUP BY g.zona_interes_750m
ORDER BY f.cant_trx DESC
LIMIT 1;
