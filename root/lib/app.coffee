body_parser = require 'body-parser'
morgan      = require 'morgan'

module.exports = (app) ->
  app.use morgan('dev')
  app.use body_parser.urlencoded(extended: true)
  app.use body_parser.json()
