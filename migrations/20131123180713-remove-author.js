module.exports = {
  up: function(migration, DataTypes, done) {
    migration.removeColumn('stories', 'author');
    done()
  },
  down: function(migration, DataTypes, done) {
    migration.addColumn('stories', 'author', {
        type: DataTypes.STRING
    });
    done()
  }
}
