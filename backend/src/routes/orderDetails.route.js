const express = require('express');
const router = express.Router();
const OrderDetailController = require('../controllers/orderDetails.controller');

router.post('/add-order', OrderDetailController.addOrderDetail);
router.get('/detail/:order_id', OrderDetailController.getOrderDetailByOrderId);
router.get('/sales-ratio/:productId', OrderDetailController.getQuantityProduct);


module.exports = router;
