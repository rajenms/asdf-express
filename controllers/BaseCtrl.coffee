class BaseCtrl

  constructor: (@Resource) ->

  renderPermissions: (req, res, options) =>
    # If user needs to be logged in to perform this function, ensure logged in
    if options?.perms?
      if options.perms is 'admin' or options.perms is 'loggedin'
        if not req.user?
          res.status(401).send
            success: 'false'
            msg: 'User not authorized'

    # If user needs to be admin to perform this function, ensure user is admin
    if options?.perms? and options.perms is 'admin'
        if not req.user? or req.user?.getDataValue('isAdmin') is false
          res.status(401).send
            success: 'false'
            msg: 'User not authorized'

  findAll: (req, res, options) =>
    console.log 'FINDING ALL'
    if options?.perms?
      @renderPermissions req, res, options
    item = new @Resource()
    item.all
      success: (items) ->
        res.status(200).send data: items
      error: () ->
        res.status(400).send
          success: 'false'
          msg: 'Could not successfully retrieve all items'

  findById: (req, res, options) =>
    if options?.perms?
      @renderPermissions req, res, options
    item = new @Resource()
    item.find req.params.id,
      success: (item) ->
        res.status(200).send data: item
      error: () ->
        res.status(400).send
          success: 'false'
          msg: 'Could not find item of id: ' + req.params.id

  add: (req, res, options) =>
    if options?.perms?
      @renderPermissions req, res, options
    item = new @Resource(req.body)
    item.save
      success: () ->
        res.status(200).send success: 'true'
      error: () ->
        res.status(400).send success: 'false'

  remove: (req, res, options) =>
    if options?.perms?
      @renderPermissions req, res, options
    item = new @Resource()
    item.destroy req.params.id,
      success: () ->
        res.status(200).send
          success: 'true'
          msg: 'Successfully deleted item of id: ' + req.params.id
      error: () ->
        res.status(400).send
          success: 'false'
          msg: 'Could not delete item of id: ' + req.params.id

  edit: (req, res, options) =>
    if options?.perms?
      @renderPermissions req, res, options
    item = new @Resource()
    item.edit req.params.id, req.body,
      success: () ->
        res.status(200).send
          success: 'true'
          msg: 'Successfully edited item of id: ' + req.params.id
      error: () ->
        res.status(400).send
          success: 'false'
          msg: 'Could not edit item of id: ' + req.params.id

module.exports = BaseCtrl