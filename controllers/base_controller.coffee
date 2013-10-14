class BaseController

  constructor: (@Resource) ->

  findAll: (req, res) =>
    item = new @Resource()
    item.all
      success: (items) ->
        res.status(200).send data: items
      error: () ->
        res.status(400).send
          success: 'false'
          msg: 'Could not successfully retrieve all items'

  findById: (req, res) =>
    item = new @Resource()
    item.find req.params.id,
      success: (item) ->
        res.status(200).send data: item
      error: () ->
        res.status(400).send
          success: 'false'
          msg: 'Could not find item of id: ' + req.params.id

  add: (req, res) =>
    item = new @Resource(req.body)
    console.log 'item: ', item
    item.save
      success: () ->
        res.status(200).send success: 'true'
      error: () ->
        res.status(400).send success: 'false'

  remove: (req, res) =>
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

  edit: (req, res) =>
    item = new @Resource()
    item.edit req.body.id, req.body,
      success: () ->
        res.status(200).send
          success: 'true'
          msg: 'Successfully edited item of id: ' + req.body.id
      error: () ->
        res.status(400).send
          success: 'false'
          msg: 'Could not edit item of id: ' + req.body.id        

module.exports = BaseController