const express = require('express');
const router = express.Router();
const productColorController = require('../controllers/productColor.controller');

router.get('/', productColorController.getAll);
router.get('/:product_id/product', productColorController.getProductColorById);

module.exports = router;
