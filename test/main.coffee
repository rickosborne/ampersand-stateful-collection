expect = require('chai').expect
StatefulCollection = require '../ampersand-stateful-collection'

describe 'StatefulCollection', ->
  subject = StatefulCollection

  it 'can #extend', -> expect(subject).to.respondTo 'extend'