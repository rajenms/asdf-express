Sequelize = require("sequelize")
BaseModel = require('./base_model')

class User extends BaseModel

  constructor: (@fields) ->
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

module.exports = User