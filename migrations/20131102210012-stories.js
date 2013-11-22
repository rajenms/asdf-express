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
        firstSentence: {
          type: DataTypes.STRING,
          allowNull: false
        },
        createdAt: DataTypes.DATE,
        updatedAt: DataTypes.DATE,
        addedBy: {
            type: DataTypes.INTEGER,
            references: 'users',
            referencesKey: 'id',
            allowNull: false
        },
        author: DataTypes.STRING
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
