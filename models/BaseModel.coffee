Sequelize = require("sequelize")

class BaseModel

  constructor: (resourceName, @fields, @schema) ->
    @sequelize = new Sequelize('asdf', 'root', 'gobadgers')
    @Resource = @sequelize.define resourceName, @schema
    if @fields?
      @resource = @Resource.build @fields

  save: (callbacks) ->
    if @fields?
      @resource.save().success(() ->
        callbacks.success()
      ).error(() ->
        callbacks.error()
      )

  find: (id, callbacks) ->
    @Resource.find(id).success((resource) ->
      if resource?
        callbacks.success(resource)
      else
        callbacks.error()
    )

  findByField: (fieldObj, callbacks) ->
    @Resource.find(where: fieldObj).success((resource) ->
      console.log 'in find by field'
      callbacks.success(resource)
    ).error((errors) ->
      console.log 'errors: ', error
      callbacks.error(errors)
    )

  all: (callbacks) ->
    @Resource.findAll().success((resources) ->
      callbacks.success(resources)
    ).error(()->
      callbacks.error()
    )

  destroy: (id, callbacks) ->
    @Resource.find(id).success((resource) ->
      # Did we find the resource?
      if resource?
        resource.destroy().success(()->
          callbacks.success()
        ).error(() ->
          callbacks.error()
        )
      else
        callbacks.error()
    )

  edit: (id, fields, callbacks) ->
    @Resource.find(id).success((resource) ->
      if resource?
        resource.updateAttributes(
          fields
        ).success(() ->
          callbacks.success()
        ).error(() ->
          callbacks.error()
        )
      else
        callbacks.error()
    )

module.exports = BaseModel
