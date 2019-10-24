# Preview stand alone
$("[data-yaml]").each ->
  code = $(@).find "code"
  code.html YAML.stringify JSON.parse(code.html()), 8, 2
  true
