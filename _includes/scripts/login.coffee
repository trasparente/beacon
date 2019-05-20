###
  Need:
  - Bootstrap modal id="loginModal"
  - Form id="loginModalContent" with a type="submit" <button> and a div.invalid-feedback
  - Login link with data-toggle="modal" and data-target="#loginModal"
  - Token input id="personalToken"
###
login = {
  form: $ '#formLogin'
  modal: $ '#loginModal'
  token: $ '#personalToken'
  link: $ "a[href='#modalLogin']"
  submit: $ "#formLogin button[type='submit']"
  feedback: $ "#formLogin .feedback"
  init: () ->
    login.form.on "submit", login.serve
    if storage.get("login.token") and login.link.text() == "Login"
      login.link.text 'Logout'
        .off "click"
        .on "click", login.logout
    true
  serve: (e) ->
    e.preventDefault()
    login.reset()
    login.submit.prop "disabled", true
    login.token.removeClass "is-invalid"
    $.ajax "{{ site.github.api_url }}/user",
      method: "GET"
      headers: {"Authorization": "token #{login.token.val()}"}
      success: login.success
      error: login.error
      complete: login.complete
    true
  complete: (request, status) ->
    login.submit.prop "disabled", false
  success: (data, status) ->
    storage.set "login.token", login.token.val()
      .set "login.user", data.login
      .set "login.created", new Date()
    login.feedback.html "Logged as #{data.login}"
      .addClass "valid"
    login.link.text "Logout"
      .off "click"
      .on "click", login.logout
    setTimeout ->
      location.href = "#{location.origin}#{location.pathname}#close"
      login.reset()
      login.token.val ""
    , 3000
    true
  error: (request, status, error) ->
    login.feedback.html "#{status}: #{error}"
      .addClass "invalid"
    login.token.addClass "is-invalid"
    true
  logout: (e) ->
    e.preventDefault()
    storage.clear()
    $(e.target).text "Login"
      .off "click"
    true
  reset: () ->
    login.feedback.html "&nbsp;"
    login.feedback.removeClass "valid invalid"
    true
}
login.init()