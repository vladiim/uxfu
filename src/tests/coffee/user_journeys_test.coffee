{ expect } = require('chai')
{ UserJourneys } = require('../../../public/js/user_journeys')
sinon = require('sinon')

describe 'UserJourneys', ->

  describe 'parse()', ->
  	it 'delegates to its chart', ->
  		code = {}
  		uj   = new UserJourneys
  		sinon.stub(uj.chart, 'parse').withArgs(code).returns('DELEGATED TO CHART')
  		expect(uj.parse(code)).to.eql('DELEGATED TO CHART')
