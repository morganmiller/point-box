class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:errors] = "Invalid login."
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
