$("#formCreate").each ->
  form = $ @
  # Commit event startup
  $("#formCommit").on "submit", (e) -> commit e, $("#dataPath").val(), YAML.stringify parseForm(), 8, 2
  # Add property
  form.on "click", "[href='#addProperty']", (e) ->
    e.preventDefault()
    form.find(">.body").append $("<fieldset>").append $("#t-name").html()
    true
  # Remove property
  form.on "click", "[href='#removeProperty']", (e) ->
    e.preventDefault()
    form.find "fieldset:last-child"
      .remove()
  # Add parameter
  form.on "click", "[href='#addParameter']", (e) ->
    e.preventDefault()
    fieldset = $(e.currentTarget).parents("fieldset").get(0)
    $(fieldset).find(".body").append $("#t-parameter").html()
  # Remove parameter
  form.on "click", "[href='#removeParameter']", (e) ->
    e.preventDefault()
    fieldset = $(e.currentTarget).parents("fieldset").get(0)
    $(fieldset).find ".fieldset:last-child"
      .remove()
  # Submit
  form.on "submit", (e) ->
    e.preventDefault()
    # Check login
    if !storage.get("login.token")
      modal_alert "You need to login", "danger"
    else location.href = "#{location.origin}#{location.pathname}#modalCommit"
    # parsed = parseForm()
    # if Object.keys(parsed).length
    #   console.log YAML.stringify parsed, 8, 2
    return
  # Parse form
  parseForm = () ->
    data = {}
    data["title"] = form.find(">[name='title']").val() if form.find(">[name='title']").val?()
    data["description"] = form.find(">[name='description']").val() if form.find(">[name='description']").val?()
    form.find("fieldset").each ->
      data["properties"] ?= {}
      parameters = {}
      $(@).find(".body .fieldset").each ->
        val = $(@).find(">input").val()
        parameters[$(@).find(">select").val()] = if $.isNumeric val then Number val else val
        true
      data["properties"][$(@).find(">input").val()] = parameters
      true
    return data