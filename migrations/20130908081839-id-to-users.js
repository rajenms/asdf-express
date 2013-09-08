module.exports = {
  up: function(migration, DataTypes, done) {
    migration.addColumn(
      'users',
      'id',
      {
        type: DataTypes.INTEGER,
        unique: true,
        autoIncrement: true
      }
    )
    done()
  },
  down: function(migration, DataTypes, done) {
    migration.removeColumn('users', 'id')
    done()
  }
}