Sequelize = require("sequelize")
BaseModel = require('./base_model')
Hashes = require('jshashes')

class User extends BaseModel

  constructor: (@fields) ->
    #console.log 'fields: ', @fields
    #@fields.password = new Hashes.MD5().hex(@fields.password)
    super 'user', @fields,
      first_name: Sequelize.STRING
      last_name: Sequelize.STRING
      email:
        type: Sequelize.STRING
        defaultValue: false
        allowNull: false
      is_admin:
        type: Sequelize.BOOLEAN
        defaultValue: false
        allowNull: false
      password: Sequelize.STRING

module.exports = User