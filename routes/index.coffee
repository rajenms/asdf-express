routes = require './routes'

# Iterate routes and set function for requests
exports.run = (app) ->
  for route in routes.all()
    functionLevels = route.function.split '.'
    Controller = require '../controllers/' + functionLevels[0]
    controller = new Controller()
    action = controller[functionLevels[1]]
    switch route.verb
      when 'get' then app.get route.path, action
      when 'post' then app.post route.path, action
      when 'delete' then app.delete route.path, action
      when 'put' then app.put route.path, action