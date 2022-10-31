CREATE TABLE ALUMNOS (
DNI int PRIMARY KEY,
Nombre varchar(255),
Apellido varchar(255),
Curso int,
CONSTRAINT fk_curso
FOREIGN KEY (Curso)
REFERENCES CURSOS(id)
);

CREATE TABLE CURSOS(
    id int PRIMARY KEY AUTOINCREMENT,
    anio int,
    div varchar(1),
    ori varchar(1),
    CONSTRAINT fk_cursos_anio
    FOREIGN KEY (anio)
    REFERENCES ANIOS(anio),
    CONSTRAINT fk_cursos_ori
    FOREIGN KEY (ori)
    REFERENCES ORIENTACIONES(orientacion)
);

CREATE TABLE ANIOS(
    anio int,
);

CREATE TABLE ORIENTACIONES(
    orientacion varchar(1),
);

CREATE TABLE MATERIAS(
    id int PRIMARY KEY AUTOINCREMENT,
    nombre varchar(255),
    anio int,
    ori varchar(1),
    CONSTRAINT fk_materias_anio
    FOREIGN KEY (anio)
    REFERENCES ANIOS(anio),
    CONSTRAINT fk_materias_ori
    FOREIGN KEY (ori)
    REFERENCES ORIENTACIONES(orientacion)
)

CREATE TABLE ASIGNATURAS(
    id int PRIMARY KEY AUTOINCREMENT,
    materia int,
    curso varchar(1)
)

