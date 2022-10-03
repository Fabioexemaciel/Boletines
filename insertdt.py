import sqlite3

conexion=sqlite3.connect("prototype.db")
conexion.execute("insert into boletines(descripcion) values (?)", ('Julio',))
conexion.commit()
cursor = conexion.execute("SELECT * FROM boletines")
for fila in cursor:
    print(fila)
conexion.close()