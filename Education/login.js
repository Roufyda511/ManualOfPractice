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
const courses = require('./courses');
var size =0;


// Check data base connection 
db_conn.connection.connect((err)=>{
    if(err) throw err;  
    console.log('connected');
} );

var router = express.Router();

 var app = express();
 app.use(session({
     secret:'secret',
    resave :true,
   saveUninitialized :true
}));
app.use('/courses',courses);
//router.use(express.static(__dirname + '/public'));









router.get('/', function(request, response) {
	response.render(path.join(__dirname + '/public/login.html'));
});


router.post('/auth', function(request, response) {
	console.log(request.body);
	
	var username = request.body.username;
	var password = request.body.password;
	var userStroredpassword ;
	var validpassword ;
	var hashed;
			if (username ) {
				ckeckIfUserExist(username).then(
					function(res,err){
						console.log(JSON.stringify(res));
						console.log(err);
						var result= JSON.parse(JSON.stringify(res));
						console.log(result);
						Object.keys(result).forEach(function(key) {
							var row = result[key];
							userStroredpassword = row.Password;
							
						});
						console.log(request.body.password);

						console.log("storedPassword:"+userStroredpassword);
						 hashed =  bcrypt.hashSync("1234",salt);
						 console.log(bcrypt.compareSync("1234",hashed));
						 console.log(hashed);
						validpassword = bcrypt.compareSync(request.body.password,userStroredpassword,function(err){
							if(err){
								console.log(err);
							}
						});
						console.log(validpassword);
						if(validpassword){
							//request.session.loggedin = true;
							//request.session.username = username;
							response.redirect('/login/home');
						}else{
							response.send('Ivalid  Password!');
						}
				
					}

	
					
					
	
					);


		
			
		

	} else {
		response.send('Please enter Username and Password!');
		response.end();
	}
});


router.get('/home', function(request, response) {
	
	response.render(path.join(__dirname + '/public/home.html'),{size:size});

});




module.exports = router;

function ckeckIfUserExist(username){
	return new Promise(function(resolve, reject) {

		db_conn.connection.query('SELECT * FROM user WHERE user_name = ? ', [username],  function(error, results, fields) {
			if (results.length > 0) {
				resolve(results);
				
				
				
			} 

			if(error){
				reject(error);
			}		
			
		});
	});
}




