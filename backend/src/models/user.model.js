'use strict';
const dbConn = require('../../config/db.config');
const bcrypt = require('bcrypt');
const saltRounds = 10;


var User = function (user) {
    this.user_id = user.user_id;
    this.user_name = user.user_name;
    this.phone = user.phone;
    this.address = user.address;
    this.email = user.email;
    this.password = user.password;
    this.gender = user.gender;
    this.created_at = user.created_at;
    this.updated_at = user.updated_at;
    this.deleted = user.deleted;

}

User.login = function (email, password, result) {
    const sql = "SELECT * FROM users WHERE email = ?";
    dbConn.query(sql, [email], function (err, res) {
        if (err) {
            console.log('SQL Error: ', err.sqlMessage);
            result(err, null);
        } else if (res.length === 0) {
            // No user found with this email
            result({ status: 401, message: 'Email hoặc mật khẩu không hợp lệ!' }, null);
        } else {
            // Compare the password
            bcrypt.compare(password, res[0].password, function (err, isMatch) {
                if (err) {
                    console.log('Compare Error: ', err);
                    result(err, null);
                } else if (!isMatch) {
                    // Password doesn't match
                    result({ status: 401, message: 'Email hoặc mật khẩu không hợp lệ!' }, null);
                } else {
                    // Login successful
                    console.log('Login successful:', res);
                    result(null, res);
                }
            });
        }
    });
};

User.register = function (user_name, phone, email, password, gender, result) {
    bcrypt.hash(password, saltRounds, function (err, hashedPassword) {
        if (err) {
            console.log('Hashing Error:', err);
            result(err, null);
            return;
        }
        const sql = "INSERT INTO `users`(`user_name`, `phone`, `email`, `password`, `gender`) VALUES (?, ?, ?, ?, ?)";
        dbConn.query(sql, [user_name, phone, email, hashedPassword, gender], function (err, res) {
            if (err) {
                console.log('SQL Error: ', err.sqlMessage);
                result(err, null);
            } else {
                console.log('Register successful:', res);
                result(null, res);
            }
        });
    });
};

User.addInfo = function (address, phone, user_id, result) {
    const sql = "UPDATE `users` SET `address` = ?, `phone` = ? WHERE `user_id` = ?"; 
    dbConn.query(sql, [address, phone, user_id], function (err, res) {
        if (err) {
            console.log('SQL Error: ', err.sqlMessage);
            result(err, null);
        } else {
            console.log('Add successful:', res);
            result(null, res);
        }
    });
};

User.getUserById = function (user_id) {
    return new Promise((resolve, reject) => {
        const sql = "SELECT * FROM users WHERE `user_id` = ?";
        dbConn.query(sql, [user_id], function (err, res) {
            if (err) {
                console.log('SQL Error: ', err.sqlMessage);
                reject(err); 
            } else {
                console.log('Get user successful:', res);
                resolve(res.length ? res[0] : null); 
            }
        });
    });
};


User.create = function (user) {
    return new Promise((resolve, reject) => {
        const sql = "INSERT INTO users (user_id, email, user_name) VALUES (?, ?, ?)";
        dbConn.query(sql, [user.user_id, user.email, user.user_name], function (err, res) {
            if (err) {
                console.log('SQL Error: ', err.sqlMessage);
                reject(err); // Reject if there's an error
            } else {
                console.log('User created successfully:', res); // Log successful creation
                resolve(res); // Resolve with response
            }
        });
    });
};

User.createGG = function (user) {
    return new Promise((resolve, reject) => {
        const sql = "INSERT INTO users (sub, email, user_name) VALUES (?, ?, ?)";
        dbConn.query(sql, [user.sub, user.email, user.user_name], function (err, res) {
            if (err) {
                console.log('SQL Error gg: ', err.sqlMessage);
                reject(err); // Reject if there's an error
            } else {
                console.log('User created successfully:', res); // Log successful creation
                resolve(res); // Resolve with response
            }
        });
    });
};


User.findOne = function (conditions) {
    return new Promise((resolve, reject) => {
        const { email } = conditions;
        const sql = "SELECT * FROM users WHERE email = ? ";
        dbConn.query(sql, [email], function (err, res) {
            if (err) {
                console.log('SQL Error find: ', err.sqlMessage);
                reject(err);  // Reject if there's an error
            } else if (res.length === 0) {
                console.log('User not found.');
                resolve(null);  // Resolve with null if no user found
            } else {
                console.log('User found:', res[0]);
                resolve(res[0]); 
            }
        });
    });
};


User.loginSuccessModel = (user_id) => new Promise(async (resolve, reject) => {
    try {
        let response = User.findOne({
            where : {user_id},
        });
        console.log("Response: ", response);
        resolve(response);
    } catch (error) {
        reject({
            err: 2,
            msg: 'Fail at auth server ' + error
        })
    }
});

User.findOne = function (conditions) {
    return new Promise((resolve, reject) => {
        // Build the SQL query dynamically based on conditions
        const sql = "SELECT * FROM users WHERE ?";
        dbConn.query(sql, conditions, function (err, res) {
            if (err) {
                console.log('SQL Error: ', err.sqlMessage);
                reject(err);  // Reject if there's an error
            } else if (res.length === 0) {
                console.log('User not found.');
                resolve(null);  // Resolve with null if no user found
            } else {
                console.log('User found:', res[0]);
                resolve(res[0]);  // Resolve with the first user data found
            }
        });
    });
};

module.exports = User;