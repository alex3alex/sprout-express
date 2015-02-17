app   = require '../lib'
argv  = require('minimist') process.argv.slice(2), alias: p: 'port'

server = app.listen argv.port or process.env.PORT or 3000, ->
  addr = server.address()
  console.log "App running at #{addr.address}:#{addr.port}!"
