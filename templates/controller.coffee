# uncomment if there is an equivalent model
# <%= S(name).classify().value() %> = require '../models/<%= S(name).camelize().value() %>'
express = require 'express'

module.exports = app = express()

app.get '/', (req, res) ->
  res.send 'test route for the <%= S(name).camelize().value() %> controller'
