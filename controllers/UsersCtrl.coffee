BaseCtrl = require('./BaseCtrl')
User = require('../models/UserModel')

class UsersCtrl extends BaseCtrl

  constructor: () ->
    super User

  add: (req, res) =>
    # Encrypt password
    Hashes = require 'jshashes'
    MD5 = new Hashes.MD5
    req.body.password = MD5.hex req.body.password

    item = new @Resource(req.body)
    item.save
      success: () ->
        res.status(200).send success: 'true'
      error: (error) ->
        res.status(400).send 
          success: 'false'
          msg: 'Error: ', error

module.exports = UsersCtrl