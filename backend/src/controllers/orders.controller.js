'use strict'
const sendmail = require('../helper/send.mail');
const Order = require('../models/orders.model');
const User = require('../models/user.model');

exports.addOrder = async function (req, res) {
    const {order_name, user_id, total_price, payment, note} = req.body;

    try {
        // Kiểm tra user
        const user = await User.getUserById(user_id);
        if (!user) {
            console.error('User not found');
            return res.status(404).send('User not found');
        }

        const order = await new Promise((resolve, reject) => {
            Order.addOrder(order_name, user_id, total_price, payment, note, (err, result) => {
                if (err) reject(err);
                else resolve(result);
            });
        });

        try {
            await sendmail({
                email: user.email,
                subject: "Chúc mừng bạn đã đặt hàng thành công.",
                html: `
                    <h2>Bạn vừa đặt hàng thành công tại Helias Shop.</h2> 
                    <ul>
                        <li>Tên đăng nhập: ${user.user_name}</li>
                        <li>Số điện thoại: ${user.phone}</li>
                        <li>Email: ${user.email}</li>
                        <li>Thanh toán: ${payment}</li>
                        <li>Tổng giá: ${total_price}</li>
                        <li>Ghi chú: ${note}</li>
                    </ul>
                    <h2>Chúc bạn mua hàng thật vui vẻ tại Helias Shop nhé!</h2>
                `
            });
            console.log('Email sent successfully.');
        } catch (emailErr) {
            console.error('Error sending email:', emailErr);
        }

        console.log('Add order successfully: ', order);
        res.send(order);
        
    } catch (err) {
        console.error('Error adding order:', err);
        res.status(500).send('Internal Server Error');
    }
};


exports.getOrderById = function (req, res) {
    const order_id = req.params.order_id;
    Order.getOrderById(order_id, function(err, order){
        if (err) {
            console.log('Get order fail:', err);
            res.send(err);
        } else {
            console.log('Get order successfully: ', order);
            res.send(order);
        }
    })
};

exports.getOrderByUserId = function (req, res) {
    const user_id = req.params.user_id;
    Order.getOrderByUserId(user_id, function(err, order){
        if (err) {
            console.log('Get order fail:', err);
            res.send(err);
        } else {
            console.log('Get order by user id successfully: ', order);
            res.send(order);
        }
    })
}


