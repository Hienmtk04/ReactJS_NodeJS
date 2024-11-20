const express = require('express');
const router = express.Router();
const productController = require('../controllers/product.controller');

router.get('/', productController.getAll);
router.get('/deal', productController.getDeal);
router.get('/dress',productController.getDressCollection);
router.get('/skirt',productController.getSkirtCollection);
router.get('/new',productController.getNewProduct);
router.get('/category/:category_id',productController.getProductByCategory);
router.get('/:product_id',productController.getProductById);
router.get('/product-name?word_search',productController.getProductByWordSearch);
router.get('/collection',productController.getProductCollection);

module.exports = router;
