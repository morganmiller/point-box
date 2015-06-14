require 'test_helper'

class UserLogoutTest < ActionDispatch::IntegrationTest
  test "user can logout" do
    user = User.create(username: "morgan", password: "password")
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"
    assert page.has_content?("Welcome, morgan")
    click_link "logout"
    refute page.has_content?("morgan")
  end
end
