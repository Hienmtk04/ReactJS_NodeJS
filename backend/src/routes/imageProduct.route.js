const express = require('express');
const router = express.Router();
const productImagesController = require('../controllers/imageProduct.controller');

router.get('/image/:product_id', productImagesController.getProductImageById);

module.exports = router;
