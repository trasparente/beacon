# COMMIT function
commit = (e, file, object) ->
  e.preventDefault()
  form = $ e.target
  submit = form.find "[type='submit']"
  feedback = form.find ".feedback"
  commit_url = "{{ site.github.api_url }}/repos/{{ site.github.repository_nwo }}/contents/_data/#{file}"
  # Functions
  get_sha = () ->
    submit.prop "disabled", true
    $.ajax commit_url,
      method: 'GET'
      headers:
        authorization: "token #{storage.get("login.token")}"
        accept: "application/vnd.github.v3.full+json"
      success: update_file
      error: error_sha
    true
  error_sha = (request, status, error) ->
    if error == 'Not Found'
      create_file()
    else
      submit.prop "disabled", false
      feedback.html "get_sha(): #{status} #{error}"
    true
  ###  
  Create new file
  @param message {string}
  @param content {string}
  ###
  create_file = () ->
    # PUT /repos/:owner/:repo/contents/:path
    $.ajax commit_url,
      method: 'PUT'
      headers: "Authorization": "token #{storage.get("login.token")}"
      data: JSON.stringify {
        message: "create_file #{file}"
        content: btoa object
      }
      success: file_created
      error: error
    true
  error = (request, status, error) ->
    submit.prop "disabled", false
    feedback.html "create_file: #{status} #{error}"
      .addClass "valid"
    true
  update_file = (data, status) ->
    # Commit
    $.ajax commit_url,
      method: 'PUT'
      headers: "Authorization": "token #{storage.get("login.token")}"
      data: JSON.stringify {
        message: "update_file #{file}"
        sha: data.sha
        content: btoa object
      }
      success: file_updated
      error: error
    true
  file_updated = (data, status) ->
    console.log data
    store_sha data
    feedback.html "file_updated: #{status} #{data}"
      .addClass "valid"
    true
  file_created = (data, status) ->
    store_sha data
    feedback.html "file_created: #{status} #{data}"
      .addClass "valid"
    true
  store_sha = (data) ->
    submit.prop "disabled", false
    storage.set 'repository.sha', data.sha
    console.log data
    true
  # Launch
  if file == ""
    feedback.html "Input a valid path"
    false
  else if !storage.get("login.token")
    modal_alert "You need to login", "danger"
  else
    # Start commit
    get_sha()
  return