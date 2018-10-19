class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to goal_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
