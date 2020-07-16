const mysql = require('mysql');
var connection = mysql.createConnection({
    host:'localhost',
    user:'test',
    password:'root',
    database:'eductionwebsite'
});



module.exports.connection = connection;