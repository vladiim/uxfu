HELPERS   = "helpers"
HOLDER    = "holder"
JQUERY    = "jquery"
BOOTSTRAP = "bootstrap"
LIBRARIES = [JQUERY, BOOTSTRAP, "#{ HELPERS }/#{ HOLDER }"]

require.config
  paths:
    "jquery": "#{ HELPERS }/#{ JQUERY }"
    "bootstrap": "#{ HELPERS }/#{ BOOTSTRAP }"

  shim:
  	"bootstrap":
      deps: [JQUERY]

require LIBRARIES, ( $ ) ->
  # run code