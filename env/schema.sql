from flask_sqlalchemy import SQLAlchemy 
from db import db

CREATE TABLE Orientadore(db.Model):
    dni = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(45), nullable=False)
    apellido = db.Column(db.String(45), nullable=False)
    email = db.Column(db.Varchar(100), nullable=False)
    ori = db.Column(db.String(3), unique = True, nullable=False) 
    /* En "ori" se hace referencia a que ciclo esta asignado 
    el orientador, no a las orientaciones de la escuela(mkt o tic),
    solo que no tengo idea de como relacionarla con el ciclo. */

CREATE TABLE Ciclo(db.Model):
    id = db.Column(db.String(3), primary_key=True)
    orientadore = db.Column(db.Integer, db.ForeignKey('orientadore.ori'), nullable=False)

CREATE TABLE Anio(db.Model):
    anio = db.Column(db.Integer, primary_key=True)
    ciclo = db.Column(db.String(3), db.ForeignKey('ciclo.id'), nullable=False)

CREATE TABLE Orientacion(db.Model):
    id = db.Column(db.String(1), primary_key=True)

CREATE TABLE Division(db.Model):
    div = db.Column(db.String(1), primary_key=True)
    orientacion = db.Column(db.String(1), db.ForeignKey('orientacion.id'), nullable=False)

CREATE TABLE Coordinadores(db.Model):
    dni = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(45), nullable=False)
    apellido = db.Column(db.String(45), nullable=False)
    email = db.Column(db.Varchar(100), nullable=False)

CREATE TABLE Curso(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    anio = db.Column(db.Integer, db.ForeignKey('anio.anio'), nullable=False)
    division = db.Column(db.String(1), db.ForeignKey('division.div'), nullable=False)
    coordi = db.Column(db.Integer, ForeignKey('coordinadores.dni'), nullable=False)

CREATE TABLE CoordiArea(db.Model):
    dni = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(45), nullable=False)
    apellido = db.Column(db.String(45), nullable=False)
    email = db.Column(db.Varchar(100), nullable=False)
    area = db.Column(db.Integer, db.ForeignKey('area.id'), nullable=False)
/* Tabla agregada */

CREATE TABLE Area(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    coordi = db.Column(db.Integer, db.ForeignKey('coordiarea.dni'), nullable=False)
    materia = db.Column(db.Integer, db.ForeignKey('materia.id'), nullable=False)
/* Aca habia una columna mas que se llamaba "email" pero no consideramos que un area tenga email */

CREATE TABLE Materia(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(45), nullable=False)
    area = db.Column(db.Integer, db.ForeignKey('area.id'), nullable=False)
    anio = db.Column(db.Integer, db.ForeignKey('anio.anio'), nullable=False)
    ori = db.Column(db.Integer, db.ForeignKey('orientacion.id'), nullable=False)

CREATE TABLE Rubrica(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    descripcion = db.Column(db.String(45), nullable=False)

CREATE TABLE RubricaMateria(db.Model):
    rubrica = db.Column(db.Integer, db.ForeignKey('rubrica.id'), nullable=False)
    materia = db.Column(db.Integer, db.ForeignKey('materia.id'), nullable=False)

CREATE TABLE Nivel(db.Model):
    id = db.Column(db.String(1), primary_key=True)
    nota = db.Column(db.Float, nullable=False)

CREATE TABLE Observable(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    nivel = db.Column(db.String(1), db.ForeignKey('nivel.id'), nullable=False)
    descripcion = db.Column(db.String(255), nullable=False)

CREATE TABLE ObservableRubrica(db.Model):
    observable = db.Column(db.Integer, db.ForeignKey('observable.id'), nullable=False)
    rubrica = db.Column(db.Integer, db.ForeignKey('rubrica.id'), nullable=False)

CREATE TABLE Asignatura(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    materia = db.Column(db.Integer, db.ForeignKey('materia.id'), nullable=False)
    curso = db.Column(db.Integer, db.ForeignKey('curso.id'), nullable=False)

CREATE TABLE Estudiante(db.Model):
    dni = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(100), nullable=False)
    apellido = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(100), unique=True, nullable=False)
    cohorte = db.Column(db.Integer)

CREATE TABLE Bimestre(db.Model):
    bimestre = db.Column(db.Integer, primary_key=True)

CREATE TABLE Calificacion(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    estudiante = db.Column(db.Integer, db.ForeignKey('estudiante.dni'), nullable=False)
    asignatura = db.Column(db.Integer, db.ForeignKey('asignatura.id'), nullable=False)
    rubrica = db.Column(db.Integer, db.ForeignKey('rubrica.id'), nullable=False)
    observable = db.Column(db.Integer, db.ForeignKey('observable.id'), nullable=False)
    bimestre = db.Column(db.Integer, db.ForeignKey('bimestre.bimestre'), nullable=False)
    anio = db.Column(db.Integer, db.ForeignKey('anio.anio'), nullable=False)
    nivel = db.Column(db.Integer, db.ForeignKey('nivel.id'), nullable=False)
