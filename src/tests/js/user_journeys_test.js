(function() {
  var UserJourneys, expect, sinon;

  expect = require('chai').expect;

  UserJourneys = require('../../../public/js/user_journeys').UserJourneys;

  sinon = require('sinon');

  describe('UserJourneys', function() {
    return describe('draw()', function() {
      return it('delegates to chart, passing in its chart options', function() {
        var code, options, uj;
        options = {};
        code = {};
        uj = new UserJourneys;
        uj.options = options;
        uj.chart = {
          drawSVG: function() {},
          parse: function() {}
        };
        sinon.stub(uj.chart, 'parse').withArgs(code).returns(uj.chart);
        sinon.stub(uj.chart, 'drawSVG').withArgs('canvas', options).returns('DELEGATED TO CHART');
        return expect(uj.draw(code)).to.eql('DELEGATED TO CHART');
      });
    });
  });

}).call(this);
