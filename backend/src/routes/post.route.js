const express = require('express');
const router = express.Router();
const postController = require('../controllers/post.controller');

router.get('/', postController.getAll);
router.get('/newpost', postController.getNewPost);
router.get('/post-detail/:post_id', postController.getPostById);

module.exports = router;
