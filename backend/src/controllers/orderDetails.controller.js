'use strict'
const OrderDetail = require('../models/orderDetails.model');

exports.addOrderDetail = function (req, res) {
    const { order_id, price, quantity, product_id, color_id, size } = req.body;
    OrderDetail.addOrderDetail(order_id, price, quantity, product_id, color_id, size, function (err, orderdetail) {
        if (err) {
            console.log('Add order detail fail:', err);
            res.send(err);
        } else {
            console.log('Add order detail successfully: ', orderdetail);
            res.json(orderdetail);
        }
    })
};

exports.getOrderDetailByOrderId = function (req, res) {
    const { order_id } = req.params;
    OrderDetail.getOrderDetailByOrderId(order_id, function (err, orderdetail) {
        if (err) {
            console.log('Get order detail fail:', err);
            res.send(err);
        } else {
            console.log('Get order detail successfully: ', orderdetail);
            res.json(orderdetail);
        }
    })
}

exports.getQuantityProduct = function (req, res) {
    const { productId } = req.params;
    OrderDetail.getQuantityProduct(productId, function (err, orderDetail) {
        if (err) {
            console.log('Failed to get order detail:', err);
            res.status(500).send(err);
        } else {
            console.log('Successfully retrieved order detail:', orderDetail);
            res.json(orderDetail);
        }
    });
};




