Sequelize = require("sequelize")
BaseModel = require('./BaseModel')

class Story extends BaseModel

  constructor: (@fields) ->
    super 'story', @fields,
      url: Sequelize.STRING
      firstSentence: Sequelize.STRING,
      author: {
        type: Sequelize.INTEGER,
        references: 'users',
        referencesKey: 'id'
      }

module.exports = Story