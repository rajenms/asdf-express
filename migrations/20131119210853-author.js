module.exports = {
  up: function(migration, DataTypes, done) {
    migration.addColumn(
        'stories',
        'addedBy',
        {
            type: DataTypes.STRING
        }
    )
    done()
  },
  down: function(migration, DataTypes, done) {
    migration.removeColumn('stories', 'addedBy')
    done()
  }
}
