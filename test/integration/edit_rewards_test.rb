require 'test_helper'

class EditRewardsTest < ActionDispatch::IntegrationTest
  
  test "admin can edit existing reward" do
    admin = User.create(username: "morgan",
                        password: "admin",
                        role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    
    Reward.create(name: "Gold Star",
                  description: "A gold star for you",
                  cost: 20)
    visit admin_rewards_path
    
    assert page.has_content?("Gold Star")
    
    click_link "Edit", match: :first
    fill_in "Name", with: "Silver Star"
    fill_in "Description", with: "A silver star for you"
    fill_in "Cost", with: 15
    click_button "Edit Reward"
    
    assert page.has_content?("Silver Star")
  end
end
  
