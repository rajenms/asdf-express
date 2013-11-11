BaseCtrl = require('./BaseCtrl')
User = require('../models/UserModel')

class UsersCtrl extends BaseCtrl

  constructor: () ->
    super User

  findAll: (req, res) =>
    super req, res, {perms: 'admin'}

  findById: (req, res) =>
    super req, res, {perms: 'admin'}

  add: (req, res) =>
    @renderPermissions req, res, {perms: 'admin'}
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

  remove: (req, res) =>
    super req, res, {perms: 'admin'}

  edit: (req, res) =>
    super req, res, {perms: 'admin'}




module.exports = UsersCtrl