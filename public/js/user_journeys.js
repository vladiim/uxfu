(function() {
  var FILES, FLOWCHART, OPTIONS, RAPHAEL;

  RAPHAEL = 'helpers/raphael';

  FLOWCHART = 'helpers/flowchart';

  OPTIONS = 'data/flowchartOptions';

  FILES = [RAPHAEL, FLOWCHART, OPTIONS];

  require(FILES, function() {
    var chart, code;
    code = document.getElementById("code").textContent;
    chart = window.flowchart.parse(code);
    return chart.drawSVG('canvas', flowchartOptions);
  });

}).call(this);
