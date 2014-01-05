(function() {
  var UserJourneys, chartOptions, flowchart, root, symbols;

  root = typeof exports !== "undefined" && exports !== null ? exports : window;

  flowchart = require('./flowchart');

  symbols = {
    'end': {
      'font-color': '#bd262c',
      'element-color': '#bd262c'
    },
    'inputoutput': {
      'font-color': 'green',
      'element-color': 'green'
    }
  };

  chartOptions = {
    'line-width': 2,
    'line-length': 30,
    'text-margin': 10,
    'font-size': 12,
    'font-color': '#6c6c6c',
    'line-color': '#6c6c6c',
    'element-color': '#6c6c6c',
    'fill': 'white',
    'yes-text': 'yes',
    'no-text': 'no',
    'arrow-end': 'block',
    'symbols': symbols
  };

  UserJourneys = (function() {
    function UserJourneys() {
      this.chart = flowchart;
      this.options = chartOptions;
    }

    UserJourneys.prototype.parse = function(code) {
      return this.chart.parse(code);
    };

    UserJourneys.prototype.draw = function(code) {
      this.parse(code);
      return this.chart.drawSVG('canvas', this.options);
    };

    return UserJourneys;

  })();

  root.UserJourneys = UserJourneys;

}).call(this);
