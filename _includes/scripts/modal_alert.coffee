###
@function {modal_alert} Modal alert
@param {message} Message for the alert
@param {color} Class for text and border
@examples
  modal_alert 'Error found', 'danger'
  modal_alert 'Valid data', 'success'
###

modal_alert = (message, classe = '') ->
  modal = $ "#modalAlert"
  # Remove old validation classes and add the new ones
  div = modal.find(">div")
  if classe then div.attr "class", "#{classe} py-3" else div.attr "class", "py-3"
  div.append message
  location.href = "#{location.origin}#{location.pathname}#modalAlert"
  true