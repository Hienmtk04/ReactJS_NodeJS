'use strict';
const Product = require('../models/product.model');

exports.getAll = function (req, res) {
    Product.getAll(function (err, products) {
        if (err) {
            console.log('Error fetching products from DB:', err);
            res.send(err);
        } else {
            console.log('Products: ', products);
            res.json(products); 
        }
    });
};

exports.getDeal = function (req, res) {
    Product.getDeal(function (err, dealProducts) {
        if (err) {
            console.log('Error fetching deal products from DB:', err);
            res.send(err);
        } else {
            console.log('Deal Products: ', dealProducts);
            res.json(dealProducts); 
        }
    });
};

exports.getDressCollection = function (req, res) {
    Product.getDressCollection(function (err, dressCollection) {
        if (err) {
            console.log('Error fetching dress collection from DB:', err);
            res.send(err);
        } else {
            console.log('Dress Collection: ', dressCollection);
            res.json(dressCollection); 
        }
    });
};

exports.getSkirtCollection = function (req, res) {
    Product.getSkirtCollection(function (err, skirtCollection) {
        if (err) {
            console.log('Error fetching skirt collection from DB:', err);
            res.send(err);
        } else {
            console.log('Skirt Collection: ', skirtCollection);
            res.json(skirtCollection); 
        }
    });
};

exports.getNewProduct = function (req, res) {
    Product.getNewProduct(function (err, newProduct) {
        if (err) {
            console.log('Error fetching new products from DB:', err);
            res.send(err);
        } else {
            console.log('New Products: ', newProduct);
            res.json(newProduct); 
        }
    });
};

exports.getProductByCategory = function (req, res) {
    const category_id = req.params.category_id;
    Product.getProductByCategory(category_id, function (err, productByCat) {
        if (err) {
            console.log('Error fetching products from DB:', err);
            res.send(err);
        } else {
            console.log('Products: ', productByCat);
            res.json(productByCat); 
        }
    });
};

exports.getProductById = function (req, res) {
    const product_id = req.params.product_id;
    Product.getProductById(product_id, function (err, productById) {
        if (err) {
            console.log('Error fetching products from DB:', err);
            res.send(err);
        } else {
            console.log('Products: ', productById);
            res.json(productById); 
        }
    });
};

exports.getProductByWordSearch = function (req, res) {
    const word_search = req.body.search; 

    if (!word_search) {
        return res.status(400).json({ error: "Search term is required" });
    }

    Product.getProductByWordSearch(word_search, function (err, productByWord) {
        if (err) {
            console.log('Error fetching products from DB:', err);
            res.status(500).send(err); 
        } else {
            console.log('Products: ', productByWord);
            res.status(200).json(productByWord); 
        }
    });
};

exports.getProductCollection = function (req, res) {
    Product.getProductCollection(function (err, product ) {
        if (err) {
            console.log('Error fetching products from DB:', err);
            res.send(err);
        } else {
            console.log('Products: ', product);
            res.json(product); 
        }
    });
};




