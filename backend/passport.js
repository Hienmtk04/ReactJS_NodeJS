require('dotenv').config()
const GoogleStrategy = require('passport-google-oauth20').Strategy;
const passport = require("passport");
const User = require('./src/models/user.model');

passport.use(new GoogleStrategy({
  clientID: process.env.GOOGLE_CLIENT_ID,
  clientSecret: process.env.GOOGLE_CLIENT_SECRET,
  callbackURL: "/api/auth/google/callback"
},
  async function (accessToken, refreshToken, profile, cb) {
    //them user vao db
    try {
      if (profile?.id) {
        const user = await User.getUserById({ where: { user_id: profile.id } });
        
        if (!user) {
          // User does not exist, create a new one
          const newUser = await User.create({
            user_id: profile.id,
            email: profile.emails[0]?.value,
            user_name: profile.displayName, 
          });
          console.log('New user created:', newUser);
          return cb(null, newUser);
        } else {
          console.log('User found:', user);
          return cb(null, user);
        }
      }
    } catch (err) {
      console.error('Error finding or creating user:', err);
      return cb(err, null);
    }
  }
));