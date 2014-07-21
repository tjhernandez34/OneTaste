class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to '/', :notice => "Welcome, #{user.username}!"
    else
      error = "Email or Password is incorrect"
      render json: error, status: 422
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/', :notice => "Logged out!"
  end

end
