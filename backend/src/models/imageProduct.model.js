'use strict';
const dbConn = require('../../config/db.config');


var ProductImage = function(productImage){
    this.product_id = productImage.product_id;
    this.image_link = productImage.image_link;
    this.image_name = productImage.image_name;
}

ProductImage.getProductImageById = function(productId, result) {
    const query = `
        SELECT *
        FROM product_images pc 
        WHERE pc.product_id = ?
    `; 
    dbConn.query(query, [productId], function(err, res) {
        if (err) {
            console.log('Error fetching images products from DB:', err);
            result(err, null); 
        } else {
            console.log('Product Images: ', res); 
            result(null, res); 
        }
    });
};

module.exports = ProductImage;