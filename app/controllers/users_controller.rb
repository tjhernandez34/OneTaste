class UsersController < ApplicationController

  def index
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    render :show
  end



 private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
