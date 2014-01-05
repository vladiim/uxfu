(function() {
  var UserJourneys, flowchart, root;

  root = typeof exports !== "undefined" && exports !== null ? exports : window;

  flowchart = require('./flowchart');

  UserJourneys = (function() {
    function UserJourneys() {
      this.chart = flowchart;
    }

    UserJourneys.prototype.parse = function(code) {
      return this.chart.parse(code);
    };

    return UserJourneys;

  })();

  root.UserJourneys = UserJourneys;

}).call(this);
