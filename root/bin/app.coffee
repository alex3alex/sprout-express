(require('../lib'))(process.env.PORT or 3000, (port) ->
  console.log "App started at port #{port}!")
