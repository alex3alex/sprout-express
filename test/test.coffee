rimraf = require 'rimraf'
path   = require 'path'
fs     = require 'fs'

test_template_path = path.resolve(_path, '../../')
test_path          = path.join(__dirname, 'tmp')

describe 'init', ->
  it 'creates new project from template', ->
    overrides =
      name: 'foobar'
      github_username: 'carrot'
      description: 'a test project'
      models: 'user,widget'
      controllers: 'users,widgets,home'

    sprout.add(name: 'test-sprout-express', uri: test_template_path)
      .then -> sprout.init(name: 'test-sprout-express', path: test_path, overrides: overrides)
      .then ->
        tgt = path.join(test_path, 'lib', 'models', 'user.coffee')
        fs.existsSync(tgt).should.be.ok
        contents = fs.readFileSync(tgt, 'utf8')
        contents.should.match /user/
      .then ->
        tgt = path.join(test_path, 'lib', 'controllers', 'widgets.coffee')
        fs.existsSync(tgt).should.be.ok
        contents = fs.readFileSync(tgt, 'utf8')
        contents.should.match /test route for the widgets controller/
      .then ->
        fs.existsSync(path.join(test_path, 'lib', 'models', '.gitkeep'))
        .should.not.be.ok
      .then -> sprout.remove('test-sprout-express')
      .then -> rimraf.sync(test_path)
      .should.be.fulfilled
