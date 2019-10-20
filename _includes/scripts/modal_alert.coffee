###
@function {modal_alert} Modal alert
@param {message} Message for the alert
@param {color} Class for text and border
@examples
  modal_alert 'Error found', 'danger'
  modal_alert 'Valid data', 'success'
###
@modal_alert = (message, classe = '') ->
  # Remove old validation classes and add the new ones
  div = $("#modalAlert").find(">div")
  if classe then div.attr "class", "#{classe}"
  div.get(0).lastChild.nodeValue = "#{message}"
  location.href = "#{location.origin}#{location.pathname}#modalAlert"
  true