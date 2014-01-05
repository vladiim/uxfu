(function() {
  var BOOTSTRAP, HELPERS, HOLDER, JQUERY, LIBRARIES;

  HELPERS = "helpers";

  HOLDER = "holder";

  JQUERY = "jquery";

  BOOTSTRAP = "bootstrap";

  LIBRARIES = [JQUERY, BOOTSTRAP, "" + HELPERS + "/" + HOLDER];

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
