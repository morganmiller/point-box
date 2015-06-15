require 'test_helper'

class DeleteRewardsTest < ActionDispatch::IntegrationTest

  test "admin can delete existing reward" do
    admin = User.create(username: "morgan",
      password: "admin",
      role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    Reward.create(name: "Gold Star",
      description: "A gold star for you",
      cost: 20)
    visit admin_rewards_path

    assert page.has_content?("Gold Star")

    click_link "Delete", match: :first
    refute page.has_content?("Gold Star")
    assert page.has_content?("All Rewards")
  end
end
  
