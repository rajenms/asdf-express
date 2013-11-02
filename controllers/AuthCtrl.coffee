User = require('../models/UserModel')
passport = require 'passport'

class AuthCtrl

  login: (req, res) =>
    passport.authenticate('local',
      successRedirect: '/admins'
      failureRedirect: '/admin/login'
      failureFlash: true
    , (req, res) ->
      res.redirect '/'
    )

  logout: (req, res) =>
    console.log 'testing'
    # req.logout()
    # res.status(200).send
    #   success: 'true'

module.exports = AuthCtrl