var express = require("express");
var app = express();
var mongojs = require('mongojs');
var db = mongojs("experimentapp", ["books"]);

app.get('/helloworld', function (req, res) {
    res.send("Hello World!!!");
});

app.get('/res_sendpalinres', function (req, res) {
    res.send("This is a plain response sent from server");
});

app.get('/res_sendjsonres', function (req, res) {
    res.json({name:"message"});
});

app.get('/res_redirecttogoogle', function (req, res) {
    res.redirect('http://www.google.com');
});

app.get('/res_download', function (req, res) {
    res.download('../../images/qmark.jpg');
});

app.set('expname', 'Express Application');
app.get('expname');

var ipaddress = process.env.OPENSHIFT_NODEJS_IP || "127.0.0.1";
var port = process.env.OPENSHIFT_NODEJS_PORT || 8080;

app.listen(port, ipaddress);