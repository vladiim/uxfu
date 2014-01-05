{ expect } = require('chai')
{ UserJourneys } = require('../../../public/js/user_journeys')
sinon = require('sinon')

describe 'UserJourneys', ->

  describe 'draw()', ->
  	it 'delegates to chart, passing in its chart options', ->
      options    = {}
      code       = {}
      uj         = new UserJourneys
      uj.options = options
      uj.chart   = {
        drawSVG: ->
        parse: -> }
      sinon.stub(uj.chart, 'parse').withArgs(code).returns(uj.chart)
      sinon.stub(uj.chart, 'drawSVG').withArgs('canvas', options).returns('DELEGATED TO CHART')
      expect(uj.draw(code)).to.eql('DELEGATED TO CHART')