require 'test_helper'

class CreateRewardsTest < ActionDispatch::IntegrationTest
  
  test "an admin can create a reward" do
    admin = User.create(username: "morgan",
      password: "admin",
      role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    
    visit new_admin_reward_path
    
    fill_in "Name", with: "Kitten gif"
    fill_in "Description", with: "The cutest kitten ever"
    fill_in "Cost", with: 5
    click_button "Create Reward"
    
    assert page.has_content?("The cutest kitten ever")
  end
end
