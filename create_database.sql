CREATE TABLE Usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefono VARCHAR(20)
);

CREATE TABLE Salas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    num_filas INT NOT NULL,
    num_columnas INT NOT NULL
);

CREATE TABLE Espacios_de_Trabajo (
    id SERIAL PRIMARY KEY,
    sala_id INT NOT NULL,
    fila INT NOT NULL,
    columna INT NOT NULL,
    disponible BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (sala_id) REFERENCES Salas(id)
);

CREATE TABLE Reservas_de_Espacios_de_Trabajo (
    id SERIAL PRIMARY KEY,
    espacio_trabajo_id INT NOT NULL,
    usuario_id INT NOT NULL,
    fecha_reserva DATE NOT NULL,
    hora_inicio TIMESTAMP NOT NULL,
    hora_fin TIMESTAMP NOT NULL,
    FOREIGN KEY (espacio_trabajo_id) REFERENCES Espacios_de_Trabajo(id),
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

CREATE TABLE Sesiones (
    id SERIAL PRIMARY KEY,
    reservas_de_espacios_de_trabajo_id INT NOT NULL,
    espacio_trabajo_id INT NOT NULL,
    usuario_id INT NOT NULL,
    hora_inicio TIMESTAMP NOT NULL,
    hora_fin TIMESTAMP NOT NULL,
    FOREIGN KEY (reservas_de_espacios_de_trabajo_id) REFERENCES Reservas_de_Espacios_de_Trabajo(id),
    FOREIGN KEY (espacio_trabajo_id) REFERENCES Espacios_de_Trabajo(id),
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
    
); 