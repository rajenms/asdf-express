routes = require './routes'

# Iterate routes and set function for requests
exports.run = (app) ->
  for route in routes.all()
    functionLevels = route.function.split '.'
    Controller = require '../controllers/' + functionLevels[0]
    controller = new Controller()
    action = controller[functionLevels[1]]

    error = (err, req, res, next) ->
      console.log 'error'
      res.send
        'status': 'err'
        'message': err.message

    switch route.verb
      when 'get' then app.get route.path, action, error
      when 'post' then app.post route.path, action, error
      when 'delete' then app.delete route.path, action, error
      when 'put' then app.put route.path, action, error