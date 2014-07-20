class FriendshipsController < ApplicationController

  def index
    params
    @user = User.find(params[:user_id])
    @friendships = @user.friendships
  end

  def create
    Friendship.create(friendship_params)
    Friendship.create(user_id: params[:friendships][:friend_id], friend_id: params[:friendships][:user_id])
    redirect_to user_path(params[:friendships][:friend_id])
  end

  def destroy
    @friendship = Friendship.find(params[:friendships][:friendship_id])
    user = session[:user_id]
    @friendship.destroy

    redirect_to user_path(user)
  end

private

  def friendship_params
    params.require(:friendships).permit(:user_id, :friend_id)
  end

end
