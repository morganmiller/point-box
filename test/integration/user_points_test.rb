require 'test_helper'

class UserPointsTest < ActionDispatch::IntegrationTest
  test "user can see points" do
    user = User.create(username: "tigerlily",
                       password: "sunshine",
                       points: 15)

    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit user_path(user)
    assert page.has_content?("You currently have 15 points.")
  end
  
  test "admin can add points" do
    user = User.create(username: "tigerlily",
                       password: "sunshine",
                       points: 20)
    user_id = user.id
    
    admin = User.create(username: "morgan",
                        password: "admin",
                        role: 1)
    
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_user_path(user)
    click_link "Add points"
    
    fill_in "Points", with: 15
    click_button "Add Points"
    
    assert page.has_content?("Point Box Users")
    
    visit admin_user_path(user_id)
    assert page.has_content?("Total points: 35")
  end
  # 
  # test "user can redeem points" do
  #   user = User.create(username: "tigerlily",
  #                      password: "sunshine",
  #                      points: 50)
  # 
  #   ApplicationController.any_instance.stubs(:current_user).returns(user)
  #   visit user_path(user)
  #   click_link "Buy some things?"
  #   
  # end
end
