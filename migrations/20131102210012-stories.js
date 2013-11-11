module.exports = {
  up: function(migration, DataTypes, done) {
    migration.createTable(
      'stories',
      {
        id: {
            type: DataTypes.INTEGER,
            unique: true,
            autoIncrement: true
        },
        url: DataTypes.STRING,
        firstSentence: DataTypes.STRING,
        createdAt: DataTypes.DATE,
        updatedAt: DataTypes.DATE,
        author: {
            type: DataTypes.INTEGER,
            references: 'users',
            referencesKey: 'id'
        }
      },
      {
        charset: 'latin1'
      }
    )
    done()
  },
  down: function(migration, DataTypes, done) {
    migration.dropTable('stories')
    done()
  }
}
