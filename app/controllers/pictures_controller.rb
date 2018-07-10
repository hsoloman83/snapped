class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
    # render :layout => false
  end

  def show
    @picture = Picture.find(params[:id])
    @comments = Comment.all.select do |comment|
      comment.picture_id == @picture.id
    # render :layout => false
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = session[:user_id]
    @user = User.find_by(id: session[:user_id])
    if @picture.save
      redirect_to @user
    else
      render :new
    end
  end



  private

  def picture_params
    params.require(:picture).permit(:title, :image_url)
  end

end
