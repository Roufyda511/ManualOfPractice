const express = require ('express');
const path = require('path');
const bodyParser = require('body-parser');
const login =require('./login');
const register = require('./register');
const courses = require('./courses');

//const zoom = require('./zoom/zoom');
const app = express();
app.use( bodyParser.json() );       // to support JSON-encoded bodies
app.use(bodyParser.urlencoded({     // to support URL-encoded bodies
  extended: true
})); 
app.listen(3000);

app.use(express.static(__dirname + '/public'));
app.set('views', __dirname + '/public');

app.engine('html', require('ejs').renderFile);
app.set('view engine', 'html');


app.use('/register',register);
app.use('/login',login);
app.use('/courses',courses);


app.get('/', function(request, response) {
	console.log(__dirname + '/public/index.html');
	response.sendFile(path.join(__dirname + '/public/index.html'));

});





