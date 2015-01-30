var express = require("express");
var app = express();

app.all("*", function (req, res,next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "X-Request-With");
    next();
});
/**
json p hacker. The server for app and the server provide data are not the same instance

*/

app.get('/foo', function (req, res) {
    res.json({message:'Hello World'});
});

var app1 = { name: "Facebook" };
var app2 = { name: "Twitter" };
var app3 = { name: "Google Maps" };
var app4 = { name: "Watsap" };

var alice = {first:"Alice",last:"Wonderland"};
var bob = { first: "BOb", last: "Marley" };

alice.projects = [app1, app2];
bob.projects = [app3, app4];
var employees = [alice,bob];

app.get('/employees', function (req,res) {
    res.json(employees);
});
app.get('/employees/:index', function (req, res) {
    var index = req.params.index
    res.json(employees[index]);
});
app.get('/employees/:index/projects', function (req, res) {
    var index = req.params.index
    res.json(employees[index].projects);
});

app.get('/employees/:index/projects/:projectIndex', function (req, res) {
    var index = req.params.index // or req.params["index"]
    var projectIndex = req.params.projectIndex;
    res.json(employees[index].projects[projectIndex]);
});

var server = app.listen(3000, function () {
    console.log('Listening on port %d', server.address().port);
});