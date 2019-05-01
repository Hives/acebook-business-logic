# frozen_string_literal: true

def sign_up(username: "User", email: "myemail@hotmail.com", password: "password")
  visit "/"
  fill_in "Username", with: username
  fill_in "Email address", with: email
  fill_in "Password", with: password
  click_button "Sign up"
end

def log_in(email: "myemail@hotmail.com", password: "password")
  visit "/login"
  fill_in "Email address", with: email
  fill_in "Password", with: password
  click_button "Log in"
end

def create_post(on_wall_of: "User", message: "Hello m0m")
  visit "/#{on_wall_of}"
  click_link "Create new post"
  fill_in "Message", with: message
  click_button "Submit"
end

def log_out
  click_button "Log out"
end
