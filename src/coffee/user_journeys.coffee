RAPHAEL   = 'helpers/raphael'
FLOWCHART = 'helpers/flowchart'
OPTIONS   = 'data/flowchartOptions'
FILES     = [RAPHAEL, FLOWCHART, OPTIONS]

require FILES, ->
  code = $("#code").textContent()
  chart = window.flowchart.parse(code)
  chart.drawSVG('canvas', flowchartOptions)