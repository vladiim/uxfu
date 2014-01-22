(function() {
  var BOOTSTRAP, HELPERS, HOLDER, JQUERY, LIBRARIES, USER_JOURNEYS;

  HELPERS = "helpers";

  HOLDER = "holder";

  JQUERY = "jquery";

  BOOTSTRAP = "bootstrap";

  USER_JOURNEYS = "user_journeys";

  LIBRARIES = [JQUERY, BOOTSTRAP, "" + HELPERS + "/" + HOLDER, USER_JOURNEYS];

  require.config({
    paths: {
      "jquery": "" + HELPERS + "/" + JQUERY,
      "bootstrap": "" + HELPERS + "/" + BOOTSTRAP
    },
    shim: {
      "bootstrap": {
        deps: [JQUERY]
      }
    }
  });

  require(LIBRARIES, function($) {});

}).call(this);
