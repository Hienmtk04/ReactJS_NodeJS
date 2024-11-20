const express = require('express');
const router = express.Router();
const authController = require('../controllers/auth.controller');

router.post('/google-auth', authController.googleLogin);

module.exports = router;