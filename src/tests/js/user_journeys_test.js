(function() {
  var UserJourneys, expect, sinon;

  expect = require('chai').expect;

  UserJourneys = require('../../../public/js/user_journeys').UserJourneys;

  sinon = require('sinon');

  describe('UserJourneys', function() {
    return describe('constructor()', function() {
      it('constructs itself with a charting tool', function() {
        var chart, uj;
        chart = 'chart';
        uj = new UserJourneys(chart);
        return expect(uj.chart).to.eql(chart);
      });
      return it('sets the default chart to flowchart', function() {
        return sinon.stub('require');
      });
    });
  });

}).call(this);
