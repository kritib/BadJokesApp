include ApplicationHelper

def login(user)
  visit login_path
  fill_in "username", with: user.username
  click_button "Login"

  cookies[:user_token] = user.session_token
end

def logout(user)
  click_button "Logout"
end