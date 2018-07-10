class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
  	@user = User.find_by(id: params[:id])
    @pictures = Picture.all
    session[:user_id] = @user.id
    @session = session[:user_id]
    # render :layout => false
  end

  def new
    @user = User.new
    # render :layout => false
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to user_path(@user)
  	else
  		render :new
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:username, :password, :email)
  end

end
