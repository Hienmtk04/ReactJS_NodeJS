'use trict';
const dbConn = require('../../config/db.config');

const Contact = function(contact) {
    this.contact_id = contact.contact_id;
    this.user_id = contact.user_id;
    this.user_name = contact.user_name;
    this.email = contact.email;
    this.phone = contact.phone;
    this.title = contact.title;
    this.content = contact.content;
    this.reply_id = contact.reply_id;
     this.created_at = contact.created_at;
    this.updated_at = contact.updated_at;
    this.status = contact.status;
    this.deleted = contact.deleted;


}

Contact.postContact = function(user_id, user_name, email, phone, content, result) {
    const sql = 'INSERT INTO `contact`( `user_id`, `user_name`, `email`, `phone`, `content`) VALUES (?,?,?,?,?)'
    dbConn.query(sql, [user_id, user_name, email, phone, content], function(err, res) {
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


module.exports = Contact;