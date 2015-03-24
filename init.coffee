path        = require 'path'
_           = require 'lodash'
S           = require 'underscore.string'
Promise     = require 'bluebird'

exports.before = (config, utils) ->
  console.log 'generating new express app'

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

exports.beforeRender = (utils, config) ->
  config.controllers = if config.controllers then config.controllers.split(/\,[\s+]?/) else ['home'];
  config.models = if config.models then config.models.split(/\,[\s+]?/) else []

exports.after = (utils, config) ->
  output_template_for_type('controller', config.controllers, utils, config)
    .then -> output_template_for_type('model', config.models, utils, config)

output_template_for_type = (type, names, utils, config) ->
  Promise.map names, (name) ->
    underscored_name = S(name).underscored().value()
    tgt_path = path.join('lib', "#{type}s", "#{underscored_name}.coffee")
    tpl_path = path.join('templates', "#{type}.coffee")
    utils.read(tpl_path).then (output) ->
      utils.write(tgt_path, output, _.extend(config, {name: name}))
