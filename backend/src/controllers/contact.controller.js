'use strict';
const dbConn = require('../../config/db.config');
const Contact = require('../models/contact.model');

exports.postContact = function (req, res) {
    const { user_id, user_name, email , phone, content } = req.body;  

    if (!user_name || !email || !phone || !content) {
        return res.status(400).send({ message: "All fields are required." });
    }

    Contact.postContact(user_id, user_name, email , phone, content, function (err, contact) {
        if (err) {
            console.log('Add fail:', err);
            return res.status(500).send(err);  // Return response directly
        } else {
            console.log('Add successfully: ', contact);
            return res.json(contact);
        }
    });
};
