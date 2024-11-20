const express = require('express');
const router = express.Router();
const colorController = require('../controllers/color.controller');

router.get('/', colorController.getAll);
router.get('/:color_id/color', colorController.getColorById);

module.exports = router;
