class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def new
  end

  def create
    user = User.find_by_email(params[:user][:email])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      render json: {user: user.id}
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
