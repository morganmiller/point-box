class Admin::UsersController < Admin::BaseController
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])  
  end
  
  def update
    @user = User.find(params[:id])
    @current_points = @user.points
    if @user.update(points: @current_points += user_params[:points].to_i)
      redirect_to admin_users_path
    else
      render :edit
    end
  end
  
private
  
  def user_params
    params.require(:user).permit(:points)
  end
end
