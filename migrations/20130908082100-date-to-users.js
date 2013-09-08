module.exports = {
  up: function(migration, DataTypes, done) {
    migration.addColumn('users','createdAt',{type: DataTypes.DATE})
    migration.addColumn('users','updatedAt',{type: DataTypes.DATE})
    done()
  },
  down: function(migration, DataTypes, done) {
    // add reverting commands here, calling 'done' when finished
    migration.removeColumn('users', 'createdAt')
    migration.removeColumn('users', 'updatedAt')
    done()
  }
}
