BaseController = require('./base_controller')
User = require('../models/user')

class Users extends BaseController

  constructor: () ->
    super User

  findAll: (req, res) ->
    user = new User()
    user.all
      success: (users) ->
        res.status(200).send data: users
      error: () ->
        res.status(400).send
          success: 'false'
          msg: 'Could not successfully retrieve all users'

  findById: (req, res) ->
    user = new User()
    user.find req.params.id,
      success: (user) ->
        res.status(200).send data: user
      error: () ->
        res.status(400).send
          success: 'false'
          msg: 'Could not find user of id: ' + req.params.id


  add: (req, res) ->
    user = new User(req.body)
    user.save
      success: () ->
        res.status(200).send success: 'true'
      error: () ->
        res.status(400).send success: 'false'

  remove: (req, res) ->
    user = new User()
    user.destroy req.body.id,
      success: () ->
        res.status(200).send
          success: 'true'
          msg: 'Successfully deleted user of id: ' + req.body.id
      error: () ->
        res.status(400).send
          success: 'false'
          msg: 'Could not delete user of id: ' + req.body.id

  edit: (req, res) ->
    user = new User()
    user.edit req.body.id, req.body,
      success: () ->
        res.status(200).send
          success: 'true'
          msg: 'Successfully edited user of id: ' + req.body.id
      error: () ->
        res.status(400).send
          success: 'false'
          msg: 'Could not edit user of id: ' + req.body.id

module.exports = Users