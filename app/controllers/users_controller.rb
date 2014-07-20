class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
    end
    render :show
  end

  def show
    @friendship = Friendship.where('user_id = ? AND friend_id = ?', session[:user_id], params[:id])
    @user = User.find(params[:id])
    puts @friendship
  end

  def search
    @results = User.search(params[:search])
  end

 private

  def user_params
    params.require(:user).permit(:username, :email, :password, :avatar, :friend_id)
  end
end
