class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])

  if user && user.authenticate(params[:session][:password])
    puts "It's gud!"
    puts session
    session[:user_id] = user.id
    redirect_to '/', :notice => "Welcome, #{user.username}!"
  else
    redirect_to '/login', :notice => "Invalid email or password"
  end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/', :notice => "Logged out!"
  end

end
