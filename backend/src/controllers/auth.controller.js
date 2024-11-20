require('dotenv').config();
const { OAuth2Client } = require('google-auth-library');
const User = require('../models/user.model');

const client_id = process.env.GOOGLE_CLIENT_ID;
const client = new OAuth2Client(client_id);

async function verifyToken(token) {
    const ticket = await client.verifyIdToken({
        idToken: token,
        audience: client_id,
    });
    return ticket.getPayload();
}
// src/controllers/auth.controller.js

module.exports = {
    googleLogin: async (req, res) => {
        const { token } = req.body;

        console.log("Received token: ", token); 

        try {
            // Verify the token
            const payload = await verifyToken(token);
            console.log("Payload: ", payload); 

            const { sub: sub, name, email } = payload;

            // Check if the user already exists in the database
            let user = await User.findOne({ email });
            if (!user) {
                // If the user does not exist, create a new user record
                user = await User.createGG({
                    sub: payload.sub,
                    email: payload.email,
                    user_name: payload.name,
                });
            }

            // Respond with user information (or any other relevant data)
            res.status(200).json([user]);
        } catch (error) {
            console.error("Google login error: ", error);
            res.status(401).json({ message: "Invalid token" }); // Return error for invalid token
        }
    },
};