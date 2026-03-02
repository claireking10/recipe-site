
const express = require('express');
const router = express.Router();
const db = require('../database').databaseConnection;

router.get('/add', (req, res) => {
    const sql = 'SELECT * FROM ingredients';
    db.query(sql, (err, results) => {
        if (err) {
            console.error(err);
            return res.send('Error fetching ingredients');
        }
        res.render('add-recipe', { 
            page_title: 'Add Recipe',
            ingredients: results
        });
    });
});

router.post('/add', (req, res) => {
    const { name, protein_type, instructions, ingredients } = req.body;
    const ingredientArray = Array.isArray(ingredients) ? ingredients : [ingredients];

    const recipeSql = 'INSERT INTO recipes (name, protein_type, instructions) VALUES (?, ?, ?)';
    db.query(recipeSql, [name, protein_type, instructions], (err, result) => {
        if (err) {
            console.error(err);
            return res.send('Error adding recipe');
        }
        const recipeId = result.insertId;

        const recipeIngredientsSql = 'INSERT INTO recipe_ingredients (recipe_id, ingredient_id) VALUES ?';
        const values = ingredientArray.map(id => [recipeId, id]);

        if (values.length > 0) {
            db.query(recipeIngredientsSql, [values], (err2) => {
                if (err2) {
                    console.error(err2);
                    return res.send('Error linking ingredients');
                }
                res.redirect(`/recipes/${recipeId}`);
            });
        } else {
            res.redirect(`/recipes/${recipeId}`);
        }
    });
});

router.get('/', (req, res) => {
    const sql = 'SELECT * FROM recipes';
    db.query(sql, (err, results) => {
        if (err) {
            console.error(err);
            return res.send('Error fetching recipes');
        }
        res.render('recipes', { 
            page_title: 'Recipes', 
            recipes: results
        });
    });
});

router.get('/:id', (req, res) => {
    const recipeId = req.params.id;
    const sql = 'SELECT * FROM recipes WHERE id = ?';
    db.query(sql, [recipeId], (err, recipeResult) => {
        if (err || recipeResult.length === 0) {
            console.error(err);
            return res.send('Recipe not found');
        }

        const ingredientsSql = `
            SELECT ingredients.name, ingredients.info
            FROM ingredients
            JOIN recipe_ingredients ON ingredients.id = recipe_ingredients.ingredient_id
            WHERE recipe_ingredients.recipe_id = ?
        `;
        db.query(ingredientsSql, [recipeId], (err, ingredientsResult) => {
            if (err) {
                console.error(err);
                return res.send('Error fetching ingredients');
            }

            res.render('recipe', { 
                page_title: recipeResult[0].name,
                recipe: recipeResult[0], 
                ingredients: ingredientsResult 
            });
        });
    });
});
module.exports = router;