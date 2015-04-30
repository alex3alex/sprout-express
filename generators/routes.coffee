path = require 'path'

module.exports = (utils, name) ->
  utils.read(path.join('stubs', 'routes.coffee'))
    .then (src) -> utils.write(path.join('lib', 'routes', "#{name}.coffee"), src, name: name)
