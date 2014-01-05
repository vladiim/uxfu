(function() {
  var UserJourneys, expect, sinon;

  expect = require('chai').expect;

  UserJourneys = require('../../../public/js/user_journeys').UserJourneys;

  sinon = require('sinon');

  describe('UserJourneys', function() {
    return describe('draw()', function() {
      return it('delegates to chart, passing in its chart options', function() {
        var code, mock, options, uj;
        options = {};
        code = {};
        uj = new UserJourneys;
        uj.options = options;
        uj.chart = {
          drawSVG: function() {},
          parse: function() {}
        };
        sinon.stub(uj.chart, 'drawSVG').withArgs('canvas', options).returns('DELEGATED TO CHART');
        mock = sinon.mock(uj.chart).expects('parse').withArgs(code);
        expect(uj.draw(code)).to.eql('DELEGATED TO CHART');
        return mock.verify();
      });
    });
  });

}).call(this);
