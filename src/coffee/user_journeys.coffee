root = exports ? window
flowchart = require('./flowchart')

class UserJourneys
	constructor: ->
    @chart = flowchart

  parse: (code) ->
    @chart.parse(code)

root.UserJourneys = UserJourneys