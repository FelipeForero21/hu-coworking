-- Ver la lista de espacios de trabajo disponibles de una sala en una sesión x
SELECT et.id, et.fila, et.columna
FROM Espacios_de_Trabajo et
LEFT JOIN Reservas_de_Espacios_de_Trabajo ret ON et.id = ret.espacio_trabajo_id
WHERE et.sala_id = 1 AND ret.id IS NULL;

-- Ver la lista de espacios de trabajo ocupados de una sala en una sesión x
SELECT et.id, et.fila, et.columna
FROM Espacios_de_Trabajo et
JOIN Reservas_de_Espacios_de_Trabajo ret ON et.id = ret.espacio_trabajo_id
WHERE et.sala_id = 1;

-- Ver las sesiones con orden por las más ocupadas
SELECT s.id, COUNT(ret.id) AS reservas_count
FROM Sesiones s
JOIN Reservas_de_Espacios_de_Trabajo ret ON s.id = ret.id
GROUP BY s.id
ORDER BY reservas_count DESC;

-- Ver las sesiones con orden por las más disponibles
SELECT s.id, COUNT(ret.id) AS reservas_count
FROM Sesiones s
JOIN Reservas_de_Espacios_de_Trabajo ret ON s.id = ret.id
GROUP BY s.id
ORDER BY reservas_count ASC;

-- Ver la lista de espacios de trabajo asignados a un usuario
SELECT et.id, et.sala_id, et.fila, et.columna
FROM Espacios_de_Trabajo et
JOIN Reservas_de_Espacios_de_Trabajo ret ON et.id = ret.espacio_trabajo_id
WHERE ret.usuario_id = 1;

-- Ver la lista de espacios de trabajo asignados a una sesión
SELECT et.id, et.sala_id, et.fila, et.columna
FROM Espacios_de_Trabajo et
JOIN Reservas_de_Espacios_de_Trabajo ret ON et.id = ret.espacio_trabajo_id
JOIN Sesiones s ON ret.id = s.id
WHERE s.id = 1;
