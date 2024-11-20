'use strict';
const Menu = require('../models/menu.model');

exports.getAll = function (req, res) {
    Menu.getAll(function (err, menu) {
        if (err) {
            console.log('Error fetching menu from DB:', err);
            res.send(err);
        } else {
            console.log('Menu: ', menu);
            res.json(menu);
        }
    });
};

exports.getMenuByParentId = function (req, res) {
    const menu_id = req.params.menu_id;
    Menu.getMenuByParentId(menu_id, function (err, subMenu) {
        if (err) {
            console.log('Error fetching menu from DB:', err);
            res.send(err);
        } else {
            console.log('Sub Menu: ', subMenu);
            res.json(subMenu);
        }
    });
};

exports.getMenuById = function (req, res) {
    const menu_id = req.params.menu_id;
    Menu.getMenuById(menu_id, function (err, menu) {
        if (err) {
            console.log("Error fetching menu from DB: ", err);
            res.send(err);
        }
        else {
            console.log("Menu: ", menu);
            res.send(menu);
        }
    });
};
