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
  }
]

# TODO: Conditions
# - cors? (in lib/index and package.json)

exports.after = (s) ->
  # classes = s.config_values.models.split(' ').map((m) -> classify(m))
  # if s.config_values.models.length then write(s, f) for f in classes

write = (s, name) ->
  # tpl = fs.readFileSync(path.join(__dirname, 'templates/model.coffee'), 'utf8')
  # output_path = path.join(s.target, "assets/js/models/#{underscored(name)}.coffee")
  # text = ejs.render(tpl, name: name)
  # fs.writeFileSync(output_path, text)
