sysPath = require 'path'

module.exports = class EmberHandlebarsCompiler
  brunchPlugin: yes
  type: 'template'
  extension: 'hbs'

  constructor: (@config) ->
    null

  compile: (data, path, callback) ->
    try
      content = JSON.stringify data.toString()
      result = "Ember.TEMPLATES[module.id] = Ember.Handlebars.compile(#{content}); module.exports = module.id;"
    catch err
      error = err
    finally
      callback error, result

  include: [
    (sysPath.join __dirname, '..', 'vendor',
      'ember-0.9.6.js')
  ]
