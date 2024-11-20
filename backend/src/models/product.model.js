'use strict';
const dbConn = require('../../config/db.config');

// Khởi tạo model Product
var Product = function(products){
    this.product_id_name  = products.product_id_name;
    this.product_name = products.product_name;
    this.product_image1 = products.product_image1;
    this.product_image2 = products.product_image2;
    this.product_description = products.product_description;
    this.product_sale = products.product_sale;
    this.product_price = products.product_price;
    this.product_price_sale = products.product_price_sale;
    this.product_quantity = products.product_quantity;
    this.category_id = products.category_id;
    this.subcategory_id = products.subcategory_id;
    this.product_slug = products.product_slug;
    this.product_detail = products.product_detail;
    this.product_status = products.product_status;
    this.created_by = products.created_by;
    this.created_at = products.created_at;
    this.updated_at = products.updated_at;
    this.deleted = products.deleted; 
};


Product.getAll = function(result) {
    dbConn.query("SELECT * FROM products", function(err, res) {
        if (err) {
            console.log('Error: ', err);
            result(err, null); 
        } else {
            console.log('Products: ', res); 
            result(null, res); 
        }
    });
};
Product.getDeal = function(result) {
    dbConn.query("SELECT * FROM products WHERE `product_sale` = 'true'", function(err, res) {
        if (err) {
            console.log('Error: ', err);
            result(err, null); 
        } else {
            console.log('Products: ', res); 
            result(null, res); 
        }
    });
};

Product.getDressCollection = function(result) {
    dbConn.query("SELECT * FROM products WHERE `category_id` = 3 LIMIT 5", function(err, res) {
        if (err) {
            console.log('Error: ', err);
            result(err, null); 
        } else {
            console.log('Products: ', res); 
            result(null, res); 
        }
    });
};

Product.getSkirtCollection = function(result) {
    dbConn.query("SELECT * FROM products WHERE `category_id` = 4 LIMIT 5", function(err, res) {
        if (err) {
            console.log('Error: ', err);
            result(err, null); 
        } else {
            console.log('Products: ', res); 
            result(null, res); 
        }
    });
};

Product.getNewProduct = function(result) {
    dbConn.query("SELECT * FROM products ORDER BY `created_at` DESC LIMIT 5", function(err, res) {
        if (err) {
            console.log('Error: ', err);
            result(err, null); 
        } else {
            console.log('Products: ', res); 
            result(null, res); 
        }
    });
};

Product.getProductByCategory = function(category_id, result) {
    dbConn.query("SELECT * FROM products WHERE `category_id` = ?", [category_id], function(err, res) {
        if (err) {
            console.log('Error: ', err);
            result(err, null); 
        } else {
            console.log('Products: ', res); 
            result(null, res); 
        }
    });
};

Product.getProductById = function(product_id, result) {

    const query = `
        SELECT *
        FROM products p
        JOIN product_color pc ON p.product_id = pc.product_id 
        JOIN colors c ON pc.color_id = c.color_id
        WHERE p.product_id = ?
    `; 
    dbConn.query(query, [product_id], function(err, res) {
        if (err) {
            console.log('Error fetching product from DB:', err);
            result(err, null); 
        } else {
            console.log('Product: ', res); 
            result(null, res); 
        }
    });
};


Product.getProductByWordSearch = function(word_search, result) {
    const query = `
        SELECT *
        FROM products p
        JOIN product_color pc ON p.product_id = pc.product_id 
        JOIN colors c ON pc.color_id = c.color_id
        WHERE p.product_name LIKE ?
    `; 
    dbConn.query(query, [`%${word_search}%`], function(err, res) {
        if (err) {
            console.log('Error fetching product from DB:', err);
            result(err, null); 
        } else {
            console.log('Product: ', res); 
            result(null, res); 
        }
    });
};

Product.getProductCollection = function(result) {
    dbConn.query("SELECT * FROM products pr JOIN collection col ON pr.collection_id = col.collection_id WHERE pr.collection_id = 2", function(err, res) {
        if (err) {
            console.log('Error: ', err);
            result(err, null); 
        } else {
            console.log('Collecion Products: ', res); 
            result(null, res); 
        }
    });
};

module.exports = Product;