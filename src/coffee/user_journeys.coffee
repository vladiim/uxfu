# root = exports ? window

# Use node require in test env and 
# client-side require in browser
# if exports?
#   flowchart = require('./flowchart')
# else
#   raphael   = require(['raphael'])
#   flowchart = require(['flowchart'])

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
    'symbols': {
      'end': {
        'font-color': '#bd262c',
        'element-color': '#bd262c'
      }, 'inputoutput': {
        'font-color': 'green',
        'element-color': 'green'
      }
    }
  }

define ['raphael', 'flowchart'], ->
  # require ['flowchart'], (flowchart) ->
  code  = document.getElementById('code').textContent
  chart = flowchart.parse(code)
  chart.drawSVG('canvas', chartOptions)

# class UserJourneys
# 	constructor: ->
#     @chart   = flowchart
#     @options = chartOptions

#   parse: (code) ->
#     @chart.parse(code)

#   draw: (code) ->
#     parsedCode = @parse(code)
#     parsedCode.drawSVG('canvas', @options)

# code = document.getElementById('code').textContent
# uj = new UserJourneys
# uj.draw(code)

# root.UserJourneys = UserJourneys