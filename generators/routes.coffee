path = require 'path'

module.exports = (utils, name) ->
  utils.src.read(path.join('stubs', 'routes.coffee'))
    .then (src) -> utils.target.write(path.join('lib', 'routes', "#{name}.coffee"), src, name: name)
