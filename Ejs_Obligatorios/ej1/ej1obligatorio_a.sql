SELECT dia, tipo_transporte, provincia, SUM(cant_viajes) as total_viajes
FROM VIAJES_TRANSP_ENE20
GROUP BY ROLLUP(dia, tipo_transporte, provincia)
ORDER BY dia NULLS FIRST, tipo_transporte NULLS FIRST, provincia NULLS FIRST
