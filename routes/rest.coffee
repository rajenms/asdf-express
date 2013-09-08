exports.get = (p, f) ->
  verb: 'get'
  path: p
  function: f

exports.post = (p, f) ->
  verb: 'post'
  path: p
  function: f

exports.delete = (p, f) ->
  verb: 'delete'
  path: p
  function: f

exports.put = (p, f) ->
  verb: 'put'
  path: p
  function: f