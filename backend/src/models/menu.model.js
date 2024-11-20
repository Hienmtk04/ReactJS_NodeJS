'use strict';
const dbConn = require('../../config/db.config');

// Khởi tạo model Menu
var Menu = function(menu){
    this.menu_id  = menu.menu_id;
    this.menu_name = menu.menu_name;
    this.link = menu.link;
    this.type = menu.type;
    this.parent_id = menu.parent_id;
    this.status = menu.status;
    this.created_at = menu.created_at;
    this.updated_at = menu.updated_at;
    this.deleted = menu.deleted;
};


Menu.getAll = function(result) {
    dbConn.query("SELECT * FROM menu ORDER BY parent_id", function(err, res) {
        if (err) {
            console.log('Error: ', err);
            result(err, null); 
        } else {
            const menuTree = buildMenuTree(res);
            result(null, menuTree); 
        }
    });
};

function buildMenuTree(menuList) {
    let menuMap = {};
    let menuTree = [];

    menuList.forEach(menu => {
        menuMap[menu.menu_id] = { ...menu, submenus: [] };
    });

    menuList.forEach(menu => {
        if (menu.parent_id === 0) {
            menuTree.push(menuMap[menu.menu_id]);
        } else {
            if (menuMap[menu.parent_id]) {
                menuMap[menu.parent_id].submenus.push(menuMap[menu.menu_id]);
            }
        }
    });

    return menuTree;
}

module.exports = Menu;