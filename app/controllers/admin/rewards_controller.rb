class Admin::RewardsController < Admin::BaseController
  
  def index
    @rewards = Reward.all
  end
  
  def new
    @reward = Reward.new()
  end
  
  def create
    @reward = Reward.new(reward_params)
    if @reward.save
      flash[:notice] = "You've successfully created the reward: '#{@reward.name}.'"
      redirect_to admin_rewards_path
    else
      flash[:error] = @reward.errors.full_messages.join(", ")
      redirect_to new_admin_reward_path
    end
  end
  
  def edit
    @reward = Reward.find(params[:id])
  end
  
  def update
    @reward = Reward.find(params[:id])
    @reward.update(reward_params)
    if @reward.save
      redirect_to admin_rewards_path
    else
      flash[:error] = @reward.errors.full_messages.join(", ")
      redirect_to edit_admin_reward_path(@reward)
    end
  end
  
private
  
  def reward_params
    params.require(:reward).permit(:name, :description, :cost)
  end
end
