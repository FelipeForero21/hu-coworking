-- Poblamiento de la tabla Usuarios con 100 registros
INSERT INTO Usuarios (nombre, email, telefono)
SELECT 'Usuario ' || i, 'usuario' || i || '@example.com', '123456789' || i
FROM generate_series(1, 100) AS s(i);

-- Poblamiento de la tabla Salas con 10 registros (10 filas x 10 columnas = 100 espacios de trabajo por sala)
INSERT INTO Salas (nombre, num_filas, num_columnas)
SELECT 'Sala ' || i, 10, 10
FROM generate_series(1, 10) AS s(i);

-- Poblamiento de la tabla Espacios_de_Trabajo con 1000 registros (10 salas x 100 espacios por sala)
INSERT INTO Espacios_de_Trabajo (sala_id, fila, columna, disponible)
SELECT s.id, f, c, true
FROM Salas s, generate_series(1, 10) f, generate_series(1, 10) c;

-- Poblamiento de la tabla Reservas_de_Espacios_de_Trabajo con 100 registros
INSERT INTO Reservas_de_Espacios_de_Trabajo (espacio_trabajo_id, usuario_id, fecha_reserva, hora_inicio, hora_fin)
SELECT et.id, u.id, current_date, current_timestamp, current_timestamp + interval '2 hours'
FROM Espacios_de_Trabajo et
JOIN Usuarios u ON (et.id % 100 + 1) = u.id
LIMIT 100;

-- Poblamiento de la tabla Sesiones con 100 
INSERT INTO Sesiones (reservas_de_espacios_de_trabajo_id, espacio_trabajo_id, usuario_id, hora_inicio, hora_fin)
SELECT ret.id, et.id, u.id, current_timestamp, current_timestamp + interval '2 hours'
FROM Reservas_de_Espacios_de_Trabajo ret
JOIN Espacios_de_Trabajo et ON ret.espacio_trabajo_id = et.id
JOIN Usuarios u ON ret.usuario_id = u.id
LIMIT 100;
