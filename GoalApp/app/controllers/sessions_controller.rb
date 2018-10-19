class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if @user
      log_in!(@user)
      redirect_to goal_url
    else
      flash[:errors] = "Username or Password is incorrect"
      render :new
    end
  end

  def destroy
    log_out!
  end
end
