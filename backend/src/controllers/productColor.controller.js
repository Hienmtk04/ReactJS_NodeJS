'use strict';
const ProductColor = require('../models/productColor.model');

exports.getAll = function(req, res) {
    ProductColor.getAll(function(err, colorProduct) {
        if (err) {
            console.log('Error fetching color products from DB:', err);
            res.send(err);
        } else {
            console.log('Products: ', colorProduct);
            res.json(colorProduct); 
        }
    });
};

exports.getProductColorById = function(req, res) {
    const productId = req.params.product_id;  
    ProductColor.getProductColorById(productId, function(err, colorProduct) {
        if (err) {
            console.log('Error fetching color products from DB:', err);
            res.send(err);
        } else {
            console.log('Products: ', colorProduct);
            res.json(colorProduct); 
        }
    });
};