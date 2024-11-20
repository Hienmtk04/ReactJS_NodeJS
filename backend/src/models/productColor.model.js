'use strict';
const dbConn = require('../../config/db.config');


var ProductColor = function(productColor){
    this.product_id = productColor.product_id;
    this.color_id = productColor.color_id;
    this.color_image = productColor.color_image;
}

ProductColor.getAll = function(result) {
    dbConn.query("SELECT * FROM product_color", function(err, res) {
        if (err) {
            console.log('Error: ', err);
            result(err, null); 
        } else {
            console.log('Color Products: ', res); 
            result(null, res); 
        }
    });
}; 

ProductColor.getProductColorById = function(productId, result) {
    const query = `
        SELECT *
        FROM product_color pc 
        JOIN colors c ON pc.color_id = c.color_id 
        WHERE pc.product_id = ?
    `; 
    dbConn.query(query, [productId], function(err, res) {
        if (err) {
            console.log('Error fetching color products from DB:', err);
            result(err, null); 
        } else {
            console.log('Product Colors: ', res); 
            result(null, res); 
        }
    });
};

module.exports = ProductColor;