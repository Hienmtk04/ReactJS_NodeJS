'use strict';
const dbConn = require('../../config/db.config');

var Order = function(order) {
    this.order_id = order.order_id,
    this.order_name = order.order_name,
    this.user_id = order.user_id,
    this.total_price = order.total_price,
    this.status_id = order.status_id,
    this.payment = order.payment,
    this.created_at = order.created_at,
    this.updated_at = order.updated_at
}

Order.addOrder = function(order_name, user_id, total_price, payment, note, result) {
    console.log('Adding order with:', {order_name, user_id, total_price, payment, note });

    const sql = "INSERT INTO `orders`(`order_name`, `user_id`, `total_price`, `payment`, `note`) VALUES (?,?,?,?,?)";

    dbConn.query(sql, [order_name, user_id, total_price, payment, note], function(err, res) {
        if (err) {
            console.error('SQL Error: ', err);
            return result(err, null);
        } else {
            if (res.affectedRows > 0) {
                console.log('Add order successful: ', res);
                console.log('Insert ID: ', res.insertId); 
                return result(null, res);
            } else {
                console.error('No rows affected');
                return result(new Error('No rows affected'), null);
            }
        }
    });
};

Order.getOrderById = function(order_id, result){
    const sql = "SELECT * FROM orders WHERE order_id = ?"
    dbConn.query(sql, order_id, function(err, res){
        if(err){
            console.log('SQL Error: ', err);
            result(err, null);
        }
        else{
            console.log('Get order successfull: ', res);
            result(null, res);
        }
    });
};

Order.getOrderByUserId = function(user_id, result){
    const sql = "SELECT * FROM orders o JOIN users u ON u.user_id = o.user_id  WHERE o.user_id = ? ORDER BY o.created_at DESC"
    dbConn.query(sql, user_id, function(err, res){
        if(err){
            console.log('SQL Error: ', err);
            result(err, null);
        }
        else{
            console.log('Get order by user id successfull: ', res);
            result(null, res);
        }
    });
};

module.exports = Order;
