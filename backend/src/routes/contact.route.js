const express = require('express');
const router = express.Router();
const ContactController = require('../controllers/contact.controller');

router.post('/add-contact', ContactController.postContact);


module.exports = router;
