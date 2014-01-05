root      = exports ? window
flowchart = require('./flowchart')

symbols = {
    'end': {
      'font-color': '#bd262c',
      'element-color': '#bd262c'
    },
    'inputoutput': {
      'font-color': 'green',
      'element-color': 'green'
    }
}

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
}

class UserJourneys
	constructor: ->
    @chart   = flowchart
    @options = chartOptions

  parse: (code) ->
    @chart.parse(code)

  draw: (code) ->
    @parse(code)
    @chart.drawSVG('canvas', @options)

root.UserJourneys = UserJourneys