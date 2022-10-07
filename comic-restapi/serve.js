const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const Heroes = require('./api/heroes');

const app = express();

app.use(bodyParser.urlencoded({ extended: false}));
//app.use(bodyParser.json);

app.use('/api/heroes/', Heroes);

/*app.get("/", (req, res) => {
    res.send("Welcome a api rest");
})*/

/*app.get('/'. function (req, res) {
    Heroes.find().select().then((data) => {
        
    })
})*/

mongoose.connect(
    "mongodb://localhost:27017/comic",
    { useNewUrlParser: true},
    (err, res) => {
        err && console.log('error conectando a la db');
        app.listen(4000, () => {
            console.log("Servidor corriendo en http://localhost:4000");
        })
    }
)