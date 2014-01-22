APP       = "app"
RAPHAEL   = 'helpers/raphael'
FLOWCHART = 'helpers/flowchart'
OPTIONS   = 'data/flowchartOptions'

FILES     = [APP, RAPHAEL, FLOWCHART, OPTIONS]

require FILES, ->
  init = ->
    $(".user_journey_item").on("click", loadUserJourney)

  loadUserJourney = (event) ->
    event.preventDefault()
    uj    = event.target
    title = $(uj).data('title')
    code  = $(uj).data('code')
    updateUJPage(title, code)

  updateUJPage = (title, code) ->
    $("h3.user_journey_name").text(title)
    instructions = $("h4.user_journey_instructions")
    if instructions then instructions.remove()
    if $("svg") then $("svg").remove()
    drawFlowchart(code)

  drawFlowchart = (code) ->
    chart = window.flowchart.parse(code)
    chart.drawSVG('canvas', flowchartOptions)

  init()