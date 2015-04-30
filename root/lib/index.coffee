express = require 'express'

app = express()

require('./app')(app)
require('./routes')(app)

module.exports = (port, callback) ->
  app.listen port, -> callback(port)
