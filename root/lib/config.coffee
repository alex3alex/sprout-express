config  = require '../config'
_       = require 'lodash'

env = process.env.NODE_ENV or 'development'

conf = config.base ?= {}
conf = _.merge conf, config[env] or {}

module.exports = conf
