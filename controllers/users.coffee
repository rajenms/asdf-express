BaseController = require('./base_controller')
User = require('../models/user')

class Users extends BaseController

  constructor: () ->
    super User

module.exports = Users