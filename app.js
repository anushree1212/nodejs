// app.js

const express = require('express');
const app = express();
const port = 3000;

// Middleware to parse JSON
app.use(express.json());

// Sample route
app.get('/', (req, res) => {
  res.send('Happiness is not by chance, but by choice !');
});

// Server listening
app.listen(port, () => {
  console.log(`Server running at http://localhost:${3000}`);
});
