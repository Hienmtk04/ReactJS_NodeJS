const express = require('express');
const router = express.Router();
const OrderController = require('../controllers/orders.controller');

router.post('/add-order', OrderController.addOrder);
router.get('/:order_id', OrderController.getOrderById);
router.get('/order-by-user/:user_id', OrderController.getOrderByUserId);

module.exports = router;
