r = require './rest'
baseApi = '/api/v1/'

exports.all = () ->
  routes = [

    # Session
    r.get baseApi + 'session', 'SessionCtrl.getSession'

    # Users
    r.get baseApi + 'users', 'UsersCtrl.findAll'
    r.get baseApi + 'user/:id', 'UsersCtrl.findById'
    r.post baseApi + 'user', 'UsersCtrl.add'
    r.delete baseApi + 'user/:id', 'UsersCtrl.remove'
    r.put baseApi + 'user/:id', 'UsersCtrl.edit'

    # Stories
    r.get baseApi + 'stories', 'StoriesCtrl.findAll'
    r.get baseApi + 'story/:id', 'StoriesCtrl.findById'
    r.post baseApi + 'story', 'StoriesCtrl.add'
    r.delete baseApi + 'story/:id', 'StoriesCtrl.remove'
    r.put baseApi + 'story/:id', 'StoriesCtrl.edit'

  ]