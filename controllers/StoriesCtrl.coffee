BaseCtrl = require('./BaseCtrl')
Story = require('../models/StoryModel')

class StoriesCtrl extends BaseCtrl

  constructor: () ->
    super Story

  findAll: (req, res) =>
    super req, res

  findById: (req, res) =>
    super req, res

  add: (req, res) =>
    super req, res, {perms: 'admin'}

  remove: (req, res) =>
    super req, res, {perms: 'admin'}

  edit: (req, res) =>
    super req, res, {perms: 'admin'}

module.exports = StoriesCtrl