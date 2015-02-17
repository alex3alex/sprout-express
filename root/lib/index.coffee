controllers = require './controllers'
config      = require './config'
# express     = require 'express'
# body_parser = require 'body-parser'
# cors        = require 'cors' # TODO: conditionalize cors
# morgan      = require 'morgan'

module.exports = app = express()

app.set 'config', config

app.use morgan('dev')
app.use body_parser.urlencoded(extended: true)
app.use body_parser.json()
app.use cors()

app.use token
app.use controllers
