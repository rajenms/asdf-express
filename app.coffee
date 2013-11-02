"""
Module dependencies.
"""
express = require 'express'
routes = require './routes'
path = require 'path'
http = require 'http'
passport = require 'passport'
LocalStrategy = require('passport-local').Strategy
UserModel = require('./models/UserModel')

passport.serializeUser (user, done) ->
  done null, user.id

passport.deserializeUser (id, done) ->
  User = new UserModel()
  User.find(id,
    success: (user) ->
      done null, user
    error: (errors) ->
      console.log 'not successfully deserializing'
      done errors
  )

passport.use new LocalStrategy(
  usernameField: 'email'
  passwordField: 'password'
,
(username, password, done) ->
  User = new UserModel()
  User.verifyAndFind({email: username, password: password}, 
    success: (user) ->
      if user?
        console.log 'user!'
        done(null, user)
      else if !user?
        console.log 'no user! '
        done(null, false, {message: 'Incorrect username and/or password'})
    error: (errors) ->
      console.log 'not successful: ', errors
      done errors
  )
)

app = express()

app.configure ->
  app.set "port", process.env.PORT || 8000
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'jade'
  app.use express.favicon()
  app.use express.logger('dev')
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser('5F136A57871D7312ECE9D3DE18A25')
  app.use express.session()
  app.use passport.initialize()
  app.use passport.session()
  app.use app.router
  app.use express.static(path.join(__dirname, 'public'))

# development only
app.configure "development", ->
  app.use express.errorHandler()

routes.run(app)

app.post "/api/v1/login", passport.authenticate("local"), (req, res) ->
  user = req.user
  res.status(200).send 
    firstName: user.first_name
    lastName: user.last_name
    email: user.email

app.get "/api/v1/logout", (req, res) ->
  req.logout()
  res.status(200).send success: 'true'


http.createServer(app).listen(app.get('port'), () ->
  console.log 'Express server listening on port ' + app.get('port')
)