var mysqlite3  = require('mysql');

var conexion = mysql.createConnection({
    host: 'localhost',
    database:'alumnos_db',
    use:'root',
    passwort:''
});

conexion.connect();

conexion.connect(funcion(error),{
    if(error){
        throw error;
    },else{
        console.log('FUNCIONA'),
    }
    

});    

connection.end();