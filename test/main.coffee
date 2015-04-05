expect = require('chai').expect
StatefulCollection = require '../ampersand-stateful-collection'

describe 'StatefulCollection', ->
  subject = null
  beforeEach -> subject = new StatefulCollection()

  it 'exists', -> expect(subject).to.not.be.null