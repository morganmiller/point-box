require 'test_helper'

class UserSeesRewardsTest < ActionDispatch::IntegrationTest

  test "admin can edit existing reward" do
    user = User.create(username: "morgan",
                       password: "password")

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    Reward.create(name: "Gold Star",
                  description: "A gold star for you",
                  cost: 20)
    Reward.create(name: "Silver Star",
                  description: "A silver star for you",
                  cost: 15)
    visit rewards_path

    assert page.has_content?("Gold Star")
    assert page.has_content?("Silver Star")
  end
  
end
