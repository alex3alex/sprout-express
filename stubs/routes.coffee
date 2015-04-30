module.exports = (app) ->

  app.get '/', (req, res) ->
    res.send '<%= S(name).camelize().value() %>'
