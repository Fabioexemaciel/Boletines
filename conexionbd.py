import sqlite3

conexion=sqlite3.connect("prototype.db")
try:
    conexion.execute("""create table boletines (
                              codigo integer primary key autoincrement,
                              descripcion text
                        )""")
    print("se creo la tabla boletines")                        
except sqlite3.OperationalError as e:
    print("error es: ", e)
    print("La tabla boletines ya existe")                    
conexion.close()