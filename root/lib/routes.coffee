path   = require('path')
routes = require('indx')(path.join(__dirname, 'routes'))

module.exports = (app) ->
  route(app) for name, route of routes
