class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
    if @user.save
      format.html { redirect_to '/', notice: 'User was successfully created.' }
      format.js   {}
      format.json { render nothing: true, status: :created}
    else
      format.html { render action: "new" }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
  end



  #   if @user.save
  #     session[:user_id] = @user.id
  #   else

  #   redirect_to "/users/#{@user.id}"
  # end

  def show
    @friendship = Friendship.where('user_id = ? AND friend_id = ?', session[:user_id], params[:id])
    if @friendship == nil
      @friendship = []
    end
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
