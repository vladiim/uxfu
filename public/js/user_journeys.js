(function() {
  var options;

  options = {
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
    'symbols': {
      'end': {
        'font-color': '#bd262c',
        'element-color': '#bd262c'
      },
      'inputoutput': {
        'font-color': 'green',
        'element-color': 'green'
      }
    }
  };

  require(['raphael', 'flowchart'], function() {
    var chart, code;
    code = document.getElementById("code").textContent;
    chart = window.flowchart.parse(code);
    return chart.drawSVG('canvas', options);
  });

}).call(this);
