module.exports = {
  up: function(migration, DataTypes, done) {
    migration.createTable(
      'users',
      {
        first_name: DataTypes.STRING,
        last_name: DataTypes.STRING,
        is_admin: {
          type: DataTypes.BOOLEAN,
          defaultValue: false,
          allowNull: false
        }
      },
      {
        engine: 'MYISAM',
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