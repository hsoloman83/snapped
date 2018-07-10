class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Logged In!"
      redirect_to user_path(user)
    else
      flash[:errors] = "Cannot Find User or validate password"
      redirect_to new_user_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged Out!"
    redirect_to new_user_path
  end

end
