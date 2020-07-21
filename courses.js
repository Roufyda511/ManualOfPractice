//load modules
const express = require('express');
const session = require('express-session');
const bodyParser = require('body-parser');
const path = require('path');
const bcrypt = require('bcrypt');
var salt=  bcrypt.genSaltSync(10);
// get data base connection 
const db_conn = require('./db_connection');
const t = require('./hash');
const { json } = require('express');
const { checkServerIdentity } = require('tls');
var size =0;



var router = express.Router();

 var app = express();
 app.use(session({
     secret:'secret',
    resave :true,
   saveUninitialized :true
}));

router.get('/home',function(request, response) {
	console.log("start");
	response.render(path.join(__dirname + '/public/home.html'), {size:size });

});
router.post('/course', function(request, response) {
	console.log(request.body);
	
		var courseName = request.body.courseName;
		var searchPar = '%' + courseName+ '%';
		console.log(courseName)
			if(courseName){

				db_conn.connection.query('SELECT * FROM courses WHERE name like ? ', [searchPar],  function(error, results, fields) {
					console.log("results");
					
					if (results.length > 0) {
						size = results.length ;
						console.log(results.length);
						response.render(path.join(__dirname + '/public/home.html'), { courses: results,size:size });

						
					}
		
					if(error){
						console.log(error);
						reject(error);
					}	
			});
		}
	});
		


module.exports = router;






