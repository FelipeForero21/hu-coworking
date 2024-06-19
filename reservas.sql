-- Un usuario puede reservar un espacio de trabajo en una sesión x
INSERT INTO Reservas_de_Espacios_de_Trabajo (espacio_trabajo_id, usuario_id, fecha_reserva, hora_inicio, hora_fin)
VALUES (1, 1, '2024-06-19', '2024-06-19 08:00:00', '2024-06-19 10:00:00');

-- Un usuario puede cancelar una reserva
DELETE FROM Reservas_de_Espacios_de_Trabajo
WHERE id = 1;
