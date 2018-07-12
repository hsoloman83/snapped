class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
    # @user = User.find(params[:user_id])
  end

  def show
    @picture = Picture.find(params[:id])
    @new_comment = Comment.new

    @comments = @picture.comments
    #rails does this for you so you don't need the method

    # Comment.all.select do |comment|
    #   comment.picture_id == @picture.id
    # end

    @tags = @picture.tags
    #rails does this for you so you don't need the method

    # PictureTag.all.select do |pictag|
    #   pictag.picture_id == @picture.id
    # end

    # @user = User.find(session[:user_id])

  end

  def new
		@picture = Picture.new
		@user = User.find(session[:user_id])
	end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = session[:user_id]
    @user = User.find(session[:user_id])
    if @picture.save
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @user = User.find(session[:user_id])
    @picture.destroy
    redirect_to @user
  end

  def show_picture_tags
    @picture = Picture.find(params[:id])
    @tags = @picture.tags
  end

  private

  def picture_params
    params.require(:picture).permit(:title, :image_url)
  end

end
