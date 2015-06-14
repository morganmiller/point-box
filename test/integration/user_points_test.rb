require 'test_helper'

class UserPointsTest < ActionDispatch::IntegrationTest
  test "user can see points" do
    user = User.create(username: "tigerlily",
                       password: "sunshine",
                       points: 15)

    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit user_path(user)
    assert page.has_content?("Points: 15")
  end
end
