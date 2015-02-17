fs          = require 'fs'
path        = require 'path'
ejs         = require 'ejs'
classify    = require 'underscore.string/classify'
underscored = require 'underscore.string/underscored'
S           = require 'underscore.string'

exports.before = (sprout, done) ->
  console.log 'generating new express app'
  done()

exports.configure = [
  {
    type: 'input',
    name: 'name',
    message: 'What is the name of your project?'
  },
  {
    type: 'input',
    name: 'github_username',
    message: 'What is your github username?'
  },
  {
    type: 'input',
    name: 'description',
    message: 'Describe your project'
  },
  {
    type: 'input',
    name: 'models',
    message: 'What are your models? (separate with spaces)'
  },
  {
    type: 'input',
    name: 'controllers',
    message: 'What are your controllers? (separate with spaces)'
  }

]

exports.before_render = (sprout, done) ->
  sc = sprout.config_values.controllers
  sprout.config_values.controllers = if sc then sc.split(' ') else ['home']
  done()

exports.after = (s) ->
  # write models
  if s.config_values.models.length
    write(s, 'model', model) for model in s.config_values.models.split(' ')

  # write controllers
  if s.config_values.controllers.length
    write(s, 'controller', controller) for controller in s.config_values.controllers


write = (s, type, name) ->
  tgt = S(name).underscored().value()
  tpl = fs.readFileSync(path.join(__dirname, "templates/#{type}.coffee"), 'utf8')
  output_path = path.join(s.target, "lib/#{type}s/#{tgt}.coffee")
  text = ejs.render(tpl, {name: name, S: S })
  fs.writeFileSync(output_path, text)
