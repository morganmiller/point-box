require 'test_helper'

class UserBuysRewardsTest < ActionDispatch::IntegrationTest

  test "user can buy a reward" do
    user = User.create(username: "morgan",
                       password: "password",
                       points: 50)

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    Reward.create(name: "Gold Star",
                  description: "A gold star for you",
                  cost: 20)
    Reward.create(name: "Silver Star",
                  description: "A silver star for you",
                  cost: 15)
    visit rewards_path
    click_link "Buy", match: :first
    
    assert page.has_content?("#{user.username}'s rewards")
    assert page.has_content?("Gold Star")
  end

end
