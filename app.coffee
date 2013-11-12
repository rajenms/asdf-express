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
  app.engine 'html', require('ejs').renderFile
  #app.set 'view engine', 'jade'
  app.use express.favicon()
  app.use express.logger('dev')
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser('5F136A57871D7312ECE9D3DE18A25')
  app.use express.session()
  app.use passport.initialize()
  app.use passport.session()
  app.use "/bower_components", express.static(path.join(__dirname, 'bower_components'))
  app.use "/styles", express.static(path.join(__dirname, 'styles'))
  app.use "/scripts", express.static(path.join(__dirname, 'scripts'))
  app.use "/views", express.static(path.join(__dirname, 'views'))
  app.use express.static(path.join(__dirname, 'public'))
  app.use app.router

# development only
app.configure "development", ->
  app.use express.errorHandler()

routes.run(app)

app.post "/api/v1/login", passport.authenticate("local"), (req, res) ->
  user = req.user.dataValues
  res.status(200).send
    firstName: user.firstName
    lastName: user.lastName
    email: user.email
    id: user.id

app.get "/api/v1/logout", (req, res) ->
  req.logout()
  res.status(200).send success: 'true'

app.get "/", (req, res) ->
  res.render('index.html')

app.get "*", (req, res) ->
  res.render('index.html')



http.createServer(app).listen(app.get('port'), () ->
  console.log 'Express server listening on port ' + app.get('port')
)