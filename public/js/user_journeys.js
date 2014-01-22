(function() {
  var APP, FILES, FLOWCHART, OPTIONS, RAPHAEL;

  APP = "app";

  RAPHAEL = 'helpers/raphael';

  FLOWCHART = 'helpers/flowchart';

  OPTIONS = 'data/flowchartOptions';

  FILES = [APP, RAPHAEL, FLOWCHART, OPTIONS];

  require(FILES, function() {
    var drawFlowchart, init, loadUserJourney, updateUJPage;
    init = function() {
      return $(".user_journey_item").on("click", loadUserJourney);
    };
    loadUserJourney = function(event) {
      var code, title, uj;
      event.preventDefault();
      uj = event.target;
      title = $(uj).data('title');
      code = $(uj).data('code');
      return updateUJPage(title, code);
    };
    updateUJPage = function(title, code) {
      var instructions;
      $("h3.user_journey_name").text(title);
      instructions = $("h4.user_journey_instructions");
      if (instructions) {
        instructions.remove();
      }
      if ($("svg")) {
        $("svg").remove();
      }
      return drawFlowchart(code);
    };
    drawFlowchart = function(code) {
      var chart;
      chart = window.flowchart.parse(code);
      return chart.drawSVG('canvas', flowchartOptions);
    };
    return init();
  });

}).call(this);
