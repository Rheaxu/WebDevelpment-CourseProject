var express = require("express");
var mongojs = require('mongojs');
var db = mongojs("cs5610353",["serviceClients"]);
var app = express();

app.use(express.static(__dirname + '/public'));
app.use(express.bodyParser());

app.get("/serviceClients", function (req, res) {
    db.serviceClients.find(function (err, docs) {
        res.json(docs);
    });
});



app.post("/serviceClients", function (req, res) {
    var svc = req.body;
    console.log(svc);

    db.serviceClients.insert(req.body, function (err, doc) {
        res.json(doc);
    });
});

app.get("/serviceClients/:id", function (req, res) {
    var id = req.params.id;
    console.log(id);
    db.serviceClients.findOne({ _id: mongojs.ObjectId(id) },
        function (err, doc) {
            res.json(doc);
        }
    );
});

app.put("/serviceClients/:id", function (req, res) {
    db.serviceClients.findAndModify({
        query:{ _id: mongojs.ObjectId(req.params.id) },
        update:{ $set: { name: req.body.name } },
        new: true   //single one
    }, function (err, doc,lastErrorObject) {
        res.json(doc);
    });
});

app.delete("/serviceClients/:id", function (req, res) {
    var id = req.params.id; // OR req.params.id
    console.log(id);
    db.serviceClients.remove({ _id: mongojs.ObjectId(id) },
        function (err, doc) {
            res.json(doc);
        }
    );
});

app.listen(3000);