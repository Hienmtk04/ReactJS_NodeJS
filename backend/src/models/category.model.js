'use trict';
const dbConn = require('../../config/db.config');

const Categories = function(categories) {
    this.category_id = categories.category_id;
    this.category_name = categories.category_name;
    this.category_image = categories.category_image;
    this.category_description = categories.category_description;
    this.parent_id = categories.parent_id;
    this.created_at = categories.created_at;
    this.updated_at = categories.updated_at;
    this.deleted = categories.deleted;

}

Categories.getAll = function(result) {
    dbConn.query("SELECT * FROM `categories` WHERE `parent_id` = 0", function(err, res) {
        if(err) {
            console.log("Error: ", err); n
            result(null, res);
        }
        else {
            console.log('Categories: ', res); 
            result(null, res); 
        }
    })
};

Categories.getSubCategory = function(categoryId,result) {
    dbConn.query("SELECT * FROM `categories` WHERE `parent_id` = ?", [categoryId], function(err, res) {
        if(err) {
            console.log("Error: ", err);
            result(null, res);
        }
        else {
            console.log('Categories: ', res); 
            result(null, res); 
        }
    })
};

Categories.getCategoryById = function(categoryId, result) {
    dbConn.query("SELECT * FROM `categories` WHERE category_id = ?", [categoryId], function(err, res) {
        if (err) {
            console.log("Error: ", err);
            result(null, err); 
        } else {
            console.log('Category: ', res);
            result(null, res); 
        }
    });
};

module.exports = Categories;