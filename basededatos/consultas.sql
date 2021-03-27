-- CONSULTA PARA OBTENER REPORTES DE UN BANCO EN ESPECIFICO
SELECT bancos.BANCO_NOMBRE AS 'BANCO', sucursales.SUCURSAL_NOMBRE AS 'SUCURSAL', trabajadores.TRABAJADOR_NOMBRE AS 'VIGILANTE', reportes_diarios.REPORTE_DIARIO_DIA AS 'REPORTE', reportes_diarios.REPORTE_DIARIO_OBSERVACIONES AS 'DETALLE DEL REPORTE'
FROM reportes_diarios 
INNER JOIN sucursales ON sucursales.SUCURSAL_ID = reportes_diarios.SUCURSALES_SUCURSAL_ID
LEFT JOIN bancos ON bancos.BANCO_ID = sucursales.BANCOS_BANCO_ID
LEFT JOIN vigilantes ON vigilantes.VIGILANTE_ID = sucursales.VIGILANTES_VIGILANTE_ID
LEFT JOIN trabajadores ON trabajadores.TRABAJADOR_ID = vigilantes.TRABAJADORES_TRABAJADOR_ID
WHERE bancos.BANCO_CODIGO = "MVYJD7ASXUVNCAQPM6"

-- CONSULTA PARA OBTENER LA CANTIDAD DE BANCOS EN LA QUE TRABAJA CADA VIGILANTE
SELECT COUNT(bancos.BANCO_ID) AS "CANTIDAD DE BANCOS POR VIGILANTES", trabajadores.TRABAJADOR_NOMBRE AS 'VIGILANTE'
FROM vigilantes 
INNER JOIN sucursales ON sucursales.VIGILANTES_VIGILANTE_ID = vigilantes.VIGILANTE_ID
LEFT JOIN bancos ON bancos.BANCO_ID = sucursales.BANCOS_BANCO_ID
LEFT JOIN trabajadores ON trabajadores.TRABAJADOR_ID = vigilantes.TRABAJADORES_TRABAJADOR_ID
GROUP BY trabajadores.TRABAJADOR_NOMBRE

-- CONSULTA PARA OBTENER EL CONTROL DE HORARIOS DE UN DIA EN ESPECIFICO
SELECT control_horarios.CONTROL_HORARIO_DIA, control_horarios.CONTROL_HORARIO_ENTRADA, control_horarios.CONTROL_HORARIO_SALIDA, trabajadores.TRABAJADOR_NOMBRE, trabajadores.TRABAJADOR_RUT
FROM control_horarios
LEFT JOIN empleados ON empleados.EMPLEADO_ID = control_horarios.EMPLEADOS_EMPLEADO_ID
LEFT JOIN trabajadores ON trabajadores.TRABAJADOR_ID = empleados.TRABAJADORES_TRABAJADOR_ID
WHERE control_horarios.CONTROL_HORARIO_DIA = "2021-03-26"