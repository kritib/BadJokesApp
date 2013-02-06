include ApplicationHelper

def login(user)
  visit login_path
  fill_in "username", with: user.username
  click_button "Login"

  cookies[:session_token] = user.session_token
end