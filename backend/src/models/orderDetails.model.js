'use strict';
const dbConn = require('../../config/db.config');

var OrderDetail = function (orderdetail) {
    this.orderDetail_id = orderdetail.orderDetail_id,
        this.order_id = orderdetail.order_id,
        this.price = orderdetail.price,
        this.quantity = orderdetail.quantity,
        this.product_id = orderdetail.product_id,
        this.size = orderdetail.size,
        this.color_id = orderdetail.color_id,
        this.cost_order = orderdetail.cost_order,
        this.created_at = orderdetail.created_at,
        this.updated_at = orderdetail.updated_at
}

OrderDetail.addOrderDetail = function (order_id, price, quantity, product_id, color_id, size, result) {
    const sql = "INSERT INTO `order_details`(`order_id`, `price`, `quantity`, `product_id`, `color_id`, `size`) VALUES (?,?,?,?,?,?)"
    dbConn.query(sql, [order_id, price, quantity, product_id, color_id, size], function (err, res) {
        if (err) {
            console.log('SQL Error: ', err);
            result(err, null);
        }
        else {
            console.log('Add order successfull: ', res);
            result(null, res);
        }
    });
};

OrderDetail.getOrderDetailByOrderId = function (order_id, result) {
    const sql = ` SELECT DISTINCT od.*, p.*, c.*, pc.*
    FROM order_details od 
    JOIN products p ON p.product_id = od.product_id
    JOIN colors c ON c.color_id = od.color_id
    JOIN product_color pc ON pc.product_id = od.product_id AND pc.color_id = c.color_id
    WHERE od.order_id = ?`
    dbConn.query(sql, order_id, function (err, res) {
        if (err) {
            console.log('SQL Error: ', err);
            result(err, null);
        }
        else {
            console.log('Get order successfull: ', res);
            result(null, res);
        }
    });
};


OrderDetail.getQuantityProduct = async function (product_id, result) {
    const productQuery = `
        SELECT product_id, SUM(quantity) AS total_quantity
        FROM order_details
        WHERE product_id = ?
        GROUP BY product_id;
    `;
    dbConn.query(productQuery, [product_id], function (err, res) {
        if (err) {
            console.log('SQL Error: ', err);
            result(err, null);
        } else {
            console.log('Get order successfull: ', res);
            result(null, res);
        }
    });
};



module.exports = OrderDetail;
