controllers = require('indx')(__dirname)
express     = require 'express'

module.exports = app = express()

<% for(var i=0; i<controllers.length; i++) { %>
app.use controllers.<%= controllers[i] %><% } %>
