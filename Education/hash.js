const bcrypt = require('bcrypt');
bcrypt.genSalt(10);
async function run(){
   const salt =  bcrypt.genSaltSync(10);
   const hasded =  bcrypt.hashSync('Roufy#1234',salt);
   console.log(salt);
   console.log(hasded);
}

run();
module.exports = bcrypt;