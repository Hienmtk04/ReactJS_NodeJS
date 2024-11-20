const express = require('express');
const router = express.Router();
const categoryController = require('../controllers/category.controller');

router.get('/', categoryController.getAll);
router.get('/:category_id/subcategories', categoryController.getSubCategory);
router.get('/:category_id', categoryController.getCategoryById);


module.exports = router;
