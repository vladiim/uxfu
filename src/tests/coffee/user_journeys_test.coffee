{ expect } = require('chai')
{ UserJourneys } = require('../../../public/js/user_journeys')
sinon = require('sinon')

describe 'UserJourneys', ->

  describe 'constructor()', ->
	  it 'constructs itself with a charting tool', ->
	  	chart = 'chart'
	  	uj    = new UserJourneys(chart)
	  	expect(uj.chart).to.eql(chart)

	  it 'sets the default chart to flowchart', ->
      sinon.stub('require')