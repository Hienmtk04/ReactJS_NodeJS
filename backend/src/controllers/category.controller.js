'use strict';
const Categories = require('../models/category.model');

exports.getAll = function (req, res) {
    Categories.getAll(function (err, categories) {
        if (err) {
            console.log('Error fetching categories from DB:', err);
            res.send(err);
        } else {
            console.log('Categories: ', categories);
            res.json(categories);
        }
    });
};

exports.getSubCategory = function (req, res) {
    const categoryId = req.params.category_id;
    Categories.getSubCategory(categoryId, function (err, subcategories) {
        if (err) {
            console.log('Error fetching categories from DB:', err);
            res.send(err);
        } else {
            console.log('Categories: ', subcategories);
            res.json(subcategories);
        }
    });
};

exports.getCategoryById = function (req, res) {
    const category_id = req.params.category_id;
    Categories.getCategoryById(category_id, function (err, category) {
        if (err) {
            console.log("Error fetching category from DB: ", err);
            res.send(err);
        }
        else {
            console.log("Category: ", category);
            res.send(category);
        }
    });
};
