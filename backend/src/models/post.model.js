'use strict';
const dbConn = require('../../config/db.config');

// Khởi tạo model Post
var Post = function(post){
    this.post_id  = post.post_id;
    this.post_title = post.post_title;
    this.post_detail = post.post_detail;
    this.post_description = post.post_description;
    this.author = post.author;
    this.image = post.image;
    this.created_at = post.created_at;
    this.updated_at = post.updated_at;
    this.type = post.type;
    this.deleted = post.deleted;
};


Post.getAll = function(result) {
    dbConn.query("SELECT * FROM post WHERE deleted = 0", function(err, res) {
        if (err) {
            console.log('Error: ', err);
            result(err, null); 
        } else {
            console.log('Post: ', res); 
            result(null, res); 
        }
    });
};

Post.getNewPost = function(result) {
    dbConn.query("SELECT * FROM post WHERE deleted = 0 ORDER BY created_at DESC LIMIT 4", function(err, res) {
        if (err) {
            console.log('Error: ', err);
            result(err, null); 
        } else {
            console.log('Post: ', res); 
            result(null, res); 
        }
    });
};

Post.getPostById = function(post_id, result) {
    dbConn.query("SELECT * FROM post WHERE post_id = ?", [post_id], function(err, res) {
        if (err) {
            console.log('Error: ', err);
            result(err, null); 
        } else {
            console.log('Post detail: ', res); 
            result(null, res); 
        }
    });
};

module.exports = Post;