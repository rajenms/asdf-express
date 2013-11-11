Sequelize = require("sequelize")
BaseModel = require('./BaseModel')
Hashes = require('jshashes')

class User extends BaseModel

  constructor: (@fields) ->
    super 'user', @fields,
      firstName: Sequelize.STRING
      lastName: Sequelize.STRING
      email:
        type: Sequelize.STRING
        defaultValue: false
        allowNull: false
      isAdmin:
        type: Sequelize.BOOLEAN
        defaultValue: false
        allowNull: false
      password: Sequelize.STRING

  verifyAndFind: (fieldObj, callbacks) ->
    # Need to make sure email and encrypted password match
    Hashes = require 'jshashes'
    MD5 = new Hashes.MD5
    fieldObj.password = MD5.hex fieldObj.password
    console.log 'field obj: ', fieldObj
    @Resource.find(where: fieldObj).success((resource) ->
      console.log 'resource: ', resource.dataValues
      callbacks.success(resource)
    ).error((errors) ->
      callbacks.error(errors)
    )

module.exports = User