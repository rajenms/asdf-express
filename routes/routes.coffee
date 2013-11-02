r = require './rest'
baseApi = '/api/v1/'

exports.all = () ->
  routes = [

    # Users
    r.get baseApi + 'users', 'UsersCtrl.findAll'
    r.get baseApi + 'user/:id', 'UsersCtrl.findById'
    r.post baseApi + 'user', 'UsersCtrl.add'
    r.delete baseApi + 'user/:id', 'UsersCtrl.remove'
    r.put baseApi + 'user', 'UsersCtrl.edit'

    # Authentication
    #r.post baseApi + 'login', 'AuthCtrl.login'
    #.post baseApi + 'logout', 'AuthCtrl.logout'

  ]