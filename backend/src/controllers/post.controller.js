'use strict';
const Post = require('../models/post.model');

exports.getAll = function (req, res) {
    Post.getAll(function (err, post) {
        if (err) {
            console.log('Error fetching post from DB:', err);
            res.send(err);
        } else {
            console.log('Post: ', post);
            res.json(post); 
        }
    });
};

exports.getNewPost = function (req, res) {
    Post.getNewPost(function (err, post) {
        if (err) {
            console.log('Error fetching post from DB:', err);
            res.send(err);
        } else {
            console.log('Post: ', post);
            res.json(post); 
        }
    });
};


exports.getPostById = function (req, res) {
    const post_id = req.params.post_id;
    Post.getPostById(post_id, function (err, post) {
        if (err) {
            console.log('Error fetching post from DB:', err);
            res.send(err);
        } else {
            console.log('Post detail: ', post);
            res.json(post); 
        }
    });
};
