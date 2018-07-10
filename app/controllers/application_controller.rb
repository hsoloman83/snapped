class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  helper_method :logged_in, :current_user, :require_login

  def require_login
    unless logged_in || session[:user_id]
      flash[:error] = "Please Sign Up or Login"
      render :new
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @users = User.all
  end

  def logged_in?
    #Checks if the value of two operands are equal or not, if values are not equal then condition becomes true.
    current_user != nil
  end

  def authenticate
    unless logged_in?
      flash[:error] = "Please Login"
      redirect_to root_path
    end
  end




end
