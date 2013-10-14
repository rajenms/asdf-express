module.exports = {
  up: function(migration, DataTypes, done) {
    migration.addColumn(
      'users',
      'password',
      {
        type: DataTypes.STRING,
        allowNull: false
      }
    )    
    done()
  },
  down: function(migration, DataTypes, done) {
    migration.removeColumn('users', 'password')
    done()
  }
}