const express = require('express');
const app = express();
const db = require('./database');
const recipesRouter = require('./routes/recipes');

app.use(express.urlencoded({ extended: true }));
app.use(express.static('public'));
app.set('view engine', 'ejs');

app.use('/recipes', recipesRouter);

app.get('/', (req, res) => {
    res.render('home', { page_title: 'Home' });
});

app.listen(3000, () => {
    console.log('Recipe site running on http://localhost:3000');
});