class FriendshipsController < ApplicationController

  def create
    Friendship.create(friendship_params)
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
