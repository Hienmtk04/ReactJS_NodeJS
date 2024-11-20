const express = require('express');
const router = express.Router();
const menuController = require('../controllers/menu.controller');

router.get('/', menuController.getAll);
router.get('/:menu_id/submenu', menuController.getMenuByParentId);
router.get('/:menu_id', menuController.getMenuById);


module.exports = router;
