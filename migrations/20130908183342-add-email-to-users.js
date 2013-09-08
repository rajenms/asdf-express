module.exports = {
  up: function(migration, DataTypes, done) {
    migration.addColumn(
      'users',
      'email',
      {
        type: DataTypes.STRING,
        unique: true
      }
    )
    done()
  },
  down: function(migration, DataTypes, done) {
    migration.removeColumn('users', 'email')
    done()
  }
}
