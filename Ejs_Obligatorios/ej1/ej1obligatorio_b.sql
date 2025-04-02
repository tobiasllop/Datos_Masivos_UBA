SELECT dia, tipo_transporte, linea, SUM(cant_viajes) as total_viajes
FROM VIAJES_TRANSP_ENE20
GROUP BY GROUPING SETS((dia), (tipo_transporte), (linea), ())
ORDER BY linea NULLS FIRST, tipo_transporte NULLS FIRST, dia NULLS FIRST
