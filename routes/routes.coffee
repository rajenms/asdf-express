r = require './rest'

exports.all = () ->
  routes = [
    r.get '/users', 'users.findAll'
    r.get '/user/:id', 'users.findById'
    r.post '/user', 'users.add'
    r.delete '/user', 'users.remove'
    r.put '/user', 'users.edit'
  ]