r = require './rest'
baseApi = '/api/v1/'

exports.all = () ->
  routes = [
    r.get baseApi + 'users', 'users.findAll'
    r.get baseApi + 'user/:id', 'users.findById'
    r.post baseApi + 'user', 'users.add'
    r.delete baseApi + 'user/:id', 'users.remove'
    r.put baseApi + 'user', 'users.edit'
  ]