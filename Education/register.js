//load modules
const express = require('express');
const session = require('express-session');
const bodyParser = require('body-parser');
const path = require('path');
const bcrypt = require('bcrypt');
const joi = require('joi');
const router = express.Router();
// get data base connection 
const db_conn = require('./db_connection');
var validationError ='';
var validUserData= true;
   

const  passwordComplexity =require('joi-password-complexity');

const complexityOptions = {
    min: 10,
    max: 30,
    lowerCase: 1,
    upperCase: 1,
    numeric: 1,
    symbol: 1,
    requirementCount: 2,
  }
// get data base connection 


// Check data base connection 




const app = express();
//adding middle  ware to use it in request processing pipe line
//app.use(json());
app.use(session({
    secret:'secret',
    resave :true,
    saveUninitialized :true
}));
//app.use(urlencoded({extended:true}));
router.get('/', function(request, response) {
    var professionsList ='';
    var specialityList='';
            getProfessionList().then(
                function(res,err){
                    if(err){
                        console.log(err);
                    }else{
                    professionsList = res;
                    console.log(professionsList);
                    }

                }
            ).then(
                function(res,err){
                    getSpecialityList().then(
                        function(res,err){
                            specialityList = res;
                            console.log(validationError);

                            console.log({ profession:professionsList ,speciality: specialityList})
                            response.render(path.join(__dirname + '/public/register.html'), { profession:professionsList ,speciality: specialityList,validationError:validationError})

                        }
                        
                        

                    );
                }
            )
           
    
  
       

            
    

});
router.post('/register',function (request,response){

     validationError = '' ;
  
    var firstname = request.body.firstname;
    var lastname = request.body.lastname;
    var username = request.body.username;
    var password = request.body.password;
    var confirmed_password = request.body.confirmed_password;
    var mobile = request.body.mobile;
    var email = request.body.email;
    var profession = request.body.profession;
    var speciality = request.body.speciality;

    //Validation
  

    validateConfirmedPassword(password,confirmed_password).then(
        function(res,err){
            
            validationError += res ;
        }
    ).then(
        validatePasswordComplexity(password).then(
            function(res,err){
                validationError += res + '\n';
            }
        )
    ).then(
        checkIfUsernameExist(username).then(
            function(res,err){
                validationError += res + '\n';
                console.log("checkUser");
                console.log(validationError);
            }
        )
    );
    
   
    console.log("roufyyyyyy");
        console.log(validationError != null);
   if (validationError != null) {
         response.redirect('/register/');
          
            
        } else {
            const salt =  bcrypt.genSaltSync(10);
            console.log(salt);
            const hasdedPassword =  bcrypt.hashSync(password,salt);
            db_conn.connection.query('INSERT INTO user (First_Name,Last_Name,User_Name,Password,Confirmed_Password,Email,Mobile,Profession_id,Speciality_id)values(?,?,?,?,?,?,?,?,?)',[firstname,lastname,username,hasdedPassword,hasdedPassword,email,mobile,profession,speciality],
            (error, result, fields)=>{
                    if (error) {
                    throw error
                    }
                    else{
                        console.log("1 record inserted");
                        
                         }
                        } );

                       
                       // request.session.register =true;
                       // request.session.username =username;
                        response.redirect('/register/profile');

                        response.end();
                       
            
        }			
       
    

});


router.get('/profile', function(request, response) {
	console.log(__dirname);
	response.sendFile(path.join(__dirname + '/public/profile.html'));

});



function getProfessionList(){
	return new Promise(function(resolve, reject) {

        db_conn.connection.query('SELECT * FROM profession',  function(error, results, fields) {
            if (results.length > 0) {
                console.log(results);
                resolve(results);
               
                
            } 
            if(error){

                console.log(error);
                reject(error);
            }
            });
	});
}

function getSpecialityList(){
	return new Promise(function(resolve, reject) {

        db_conn.connection.query('SELECT * FROM specialty',  function(error, results, fields) {
            if (results.length > 0) {
                resolve(results);
               
                
            } 
            if(error){

                console.log(error);
                reject(error);
            }
            });
	});
}

//Validation Functions
function validateConfirmedPassword(password,ConfirmedPassword){
	return new Promise(function(resolve, reject) {

       
            if (password != ConfirmedPassword) {
                errorMsg = "Confirmed password doesn't match password";
                resolve(errorMsg);
               
                
            } 
           
           
	});
}
function validatePasswordComplexity(password){
	return new Promise(function(resolve, reject) {

       
        var {error}= passwordComplexity(undefined, 'Password').validate(password);
        messages ='';
        var i;
            if(error) {
                for ( i =0 ;i<error.details.length;i++){
                        messages += error.details[i].message + '\n' ;
                }
                
                    console.log(messages);
                    resolve(messages);
                    
                
            }

           
           
	});
}
function checkIfUsernameExist(username){
    return new Promise(function(resolve, reject) {

       
        db_conn.connection.query('SELECT * FROM user WHERE user_name = ? ', [username], function(error, results, fields) {
            if (results.length > 0) {
                resolve("User already registered");
              
                
                
                
            }if(error){
                reject(error);
            }

           
           
	});
});
}



module.exports = router;
