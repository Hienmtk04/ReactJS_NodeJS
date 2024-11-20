'use strict';
const dbConn = require('../../config/db.config');

var Color = function(colors){
    this.color_id  =colors.color_id;
    this.color_name  =colors.color_name;
    this.color_info = products.color_info;
};

Color.getAll = function (result) {
    dbConn.query("SELECT * FROM colors", function(err, res) {
        if (err) {
            console.log('Error: ', err);
            result(err, null); 
        } else {
            console.log('Colors: ', res); 
            result(null, res); 
        }
    });
};

Color.getColorById = function(colorId, result) {
    dbConn.query("SELECT * FROM colors WHERE color_id = ?", [colorId], function(err, res) {
        if (err) {
            console.log('Error: ', err);
            result(err, null); 
        } else {
            console.log('Colors: ', res); 
            result(null, res); 
        }
    });
};

module.exports = Color;