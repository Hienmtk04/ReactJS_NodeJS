const nodemailer = require('nodemailer');
require("dotenv").config();

const sendmail = async ({ email, subject, html }) => {
    const transporter = nodemailer.createTransport({
        host: 'smtp.gmail.com',
        port: 587,  
        secure: false,
        auth: {
            user: process.env.EMAIL_USER,
            pass: process.env.EMAIL_PASS
        }
    });

    const message = {
        from: `"Helias Shop" <${process.env.EMAIL_USER}>`, 
        to: email,
        subject: subject,
        html: html
    };

    try {
        const result = await transporter.sendMail(message);
        console.log("Email sent: ", result);
        return result;
    } catch (error) {
        console.error("Error sending email: ", error);
        throw error;
    }
};

module.exports = sendmail;
