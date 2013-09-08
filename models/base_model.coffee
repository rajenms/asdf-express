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
