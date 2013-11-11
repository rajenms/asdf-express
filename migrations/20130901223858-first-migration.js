module.exports = {
  up: function(migration, DataTypes, done) {
    migration.createTable(
      'users',
      {
        firstName: DataTypes.STRING,
        lastName: DataTypes.STRING,
        isAdmin: {
          type: DataTypes.BOOLEAN,
          defaultValue: false,
          allowNull: false
        }
      },
      {
        charset: 'latin1'
      }
    )
    done()
  },
  down: function(migration, DataTypes, done) {
    // add reverting commands here, calling 'done' when finished
    migration.dropTable('users')
    done()
  }
}