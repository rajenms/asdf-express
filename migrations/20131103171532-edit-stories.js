module.exports = {

  up: function(migration, DataTypes, done) {
    // Make url not allow null
    migration.changeColumn('stories', 'url', {
        type: DataTypes.STRING,
        allowNull: false
    })
    // Make first sentence not allow null
    migration.changeColumn('stories', 'firstSentence', {
        type: DataTypes.STRING,
        allowNull: false
    })
    // Make author not allow null
    migration.changeColumn('stories', 'author', {
        type: DataTypes.INTEGER,
        allowNull: false
    })
    done()
  },

  down: function(migration, DataTypes, done) {
    // Make url allow null
    migration.changeColumn('stories', 'url', {
        type: DataTypes.STRING,
        allowNull: true
    })
    // Make first sentence allow null
    migration.changeColumn('stories', 'firstSentence', {
        type: DataTypes.STRING,
        allowNull: true
    })
    // Make author allow null
    migration.changeColumn('stories', 'author', {
        type: DataTypes.INTEGER,
        allowNull: true
    })
    done()
  }
}
