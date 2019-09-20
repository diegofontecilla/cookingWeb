const express = require('express');
const app = express();
const path = require('path');
const bodyParser = require('body-parser');

app.use(express.static('public'))
app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.get('/', function(req, res) {
  res.sendFile(path.join(__dirname + '/public/mockApi.js'));
})

const port = process.env.PORT || 9292;

app.listen(port, () => console.log(`Listening on port ${port}...`));
