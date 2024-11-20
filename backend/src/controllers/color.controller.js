'use strict';
const Color = require('../models/color.model');

exports.getAll = function(req, res) {
    Color.getAll(function(err, color) {
        if (err) {
            console.log('Error fetching color from DB:', err);
            res.send(err);
        } else {
            console.log('Products: ', color);
            res.json(color); 
        }
    });
};

exports.getColorById = function(req, res) {
    const colorId = req.params.color_id;  
    Color.getColorById(colorId, function(err, color) {
        if (err) {
            console.log('Error fetching color from DB:', err);
            res.send(err);
        } else {
            console.log('Products: ', color);
            res.json(color); 
        }
    });
};