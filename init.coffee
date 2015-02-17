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
  templates = ['model', 'controller']
  for t in templates
    configs = s.config_values
    if t != 'controller' && configs["#{t}s"].length
      configs.models = configs["#{t}s"].split(' ')
    tgt = configs["#{t}s"]
    write(s, t, model) for model in tgt if tgt.length

write = (s, type, name) ->
  tgt = S(name).underscored().value()
  tpl = fs.readFileSync(path.join(__dirname, "templates/#{type}.coffee"), 'utf8')
  output_path = path.join(s.target, "lib/#{type}s/#{tgt}.coffee")
  text = ejs.render(tpl, {name: name, S: S })
  fs.writeFileSync(output_path, text)
