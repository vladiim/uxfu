(function() {
  var UserJourneys, expect, sinon;

  expect = require('chai').expect;

  UserJourneys = require('../../../public/js/user_journeys').UserJourneys;

  sinon = require('sinon');

  describe('UserJourneys', function() {
    return describe('parse()', function() {
      return it('delegates to its chart', function() {
        var code, uj;
        code = {};
        uj = new UserJourneys;
        sinon.stub(uj.chart, 'parse').withArgs(code).returns('DELEGATED TO CHART');
        return expect(uj.parse(code)).to.eql('DELEGATED TO CHART');
      });
    });
  });

}).call(this);
