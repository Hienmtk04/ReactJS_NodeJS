'use strict';
const ProductImages = require('../models/imageProduct.model');


exports.getProductImageById = function(req, res) {
    const productId = req.params.product_id;  
    ProductImages.getProductImageById(productId, function(err, imageProduct) {
        if (err) {
            console.log('Error fetching image products from DB:', err);
            res.send(err);
        } else {
            console.log('Products: ', imageProduct);
            res.json(imageProduct); 
        }
    });
};