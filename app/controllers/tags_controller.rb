class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to tag_path(@tag)
    else
      render :new
    end
  end

  def destroy
    @picture = Picture.find(params[:picture_id])
    @picture_tag = PictureTag.find_by(picture_id: params[:picture_id], tag_id: params[:tag_id])
    @picture_tag.delete
    redirect_to @picture
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
