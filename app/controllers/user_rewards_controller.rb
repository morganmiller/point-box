class UserRewardsController < ApplicationController
  
  def create
    reward = Reward.find(params[:reward_id])
    user = current_user
    if user.points >= reward.cost
      user.rewards << reward
      redirect_to user_path(user)
    else
      flash[:errors] = "You can't afford that. :("
      redirect_to rewards_path
    end
  end
end
