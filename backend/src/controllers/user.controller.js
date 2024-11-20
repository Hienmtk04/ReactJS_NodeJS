'use strict';
const dbConn = require('../../config/db.config');
const sendmail = require('../helper/send.mail');
const User = require('../models/user.model');

exports.login = function (req, res) {
    const email = req.body.email;
    const password = req.body.password;

    User.login(email, password, function (err, user) {
        if (err) {
            if (err.status === 401) {
                console.log('Login fail:', err.message);
                res.status(401).json({ message: err.message });
            } else {
                console.log('Server error:', err);
                res.status(500).json({ message: 'Internal server error' });
            }
        } else {
            console.log('Login successfully: ', user);
            res.json(user);
        }
    });
};

exports.register = async function (req, res) {
    const { user_name, phone, email, password, gender } = req.body;

    try {
        dbConn.query('SELECT * FROM users WHERE email = ?', [email], (err, results) => {
            if (err) {
                console.error('Error checking for existing user:', err);
                return res.status(500).send(err);
            }

            if (results.length > 0) {
                return res.status(400).json({ message: "Email đã được sử dụng. Vui lòng sử dụng tài khoản khác." });
            }
            User.register(user_name, phone, email, password, gender, async function (err, user) {
                if (err) {
                    console.log('Register fail:', err);
                    return res.status(500).send(err);
                }
                try {
                    await sendmail({
                        email: email,
                        subject: "Chúc mừng bạn đăng ký thành công.",
                        html: `
                            <h2>Bạn vừa đăng ký thành công tài khoản mua hàng tại Helias Shop.</h2> 
                            <ul>
                                <li>Tên đăng nhập: ${user_name}</li>
                                <li>Mật khẩu: ${password}</li>
                                <li>Số điện thoại: ${phone}</li>
                                <li>Email: ${email}</li>
                            </ul>
                            <h2>Chúc bạn mua hàng thật vui vẻ tại Helias Shop nhé!</h2>
                        `
                    });
                    console.log('Register successfully: ', user);
                    return res.json(user);
                } catch (emailError) {
                    console.error("Error sending registration email: ", emailError);
                    return res.status(500).json({ message: "Đăng ký thành công nhưng không thể gởi email." });
                }
            });
        });

    } catch (err) {
        console.error("Registration error:", err);
        return res.status(500).json({ message: "Đã xảy ra lỗi khi đăng ký." });
    }
};

exports.addInfo = function (req, res) {
    const { address, phone } = req.body;  // Destructure address and phone
    const user_id = req.params.user_id;

    if (!address || !user_id) {
        return res.status(400).send({ message: "Address and user_id are required." });
    }

    User.addInfo(address, phone, user_id, function (err, user) {
        if (err) {
            console.log('Add fail:', err);
            return res.status(500).send(err);  // Return response directly
        } else {
            console.log('Add successfully: ', user);
            return res.json(user);
        }
    });
};

exports.getUserById = function (req, res) {
    const user_id = req.params.user_id;
    User.getUserById(user_id, function (err, user) {
        if (err) {
            console.log('Get user fail:', err);
            res.status(500).send(err);
        } else {
            console.log('Get user successfully: ', user);
            res.json(user);
        }
    });
};