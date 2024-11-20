const express = require('express');
const router = express.Router();
const UserController = require('../controllers/user.controller');

router.post('/login', UserController.login);
router.post('/register', UserController.register);
router.post('/add-info/:user_id', UserController.addInfo);
router.get('/:user_id', UserController.getUserById);


module.exports = router;
