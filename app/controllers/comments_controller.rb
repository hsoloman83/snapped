class CommentsController < ApplicationController
  def index
    @comments = Picture.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = params[:comment][:user_id]
    @comment.picture_id = params[:comment][:picture_id]

    @user = User.find(params[:comment][:user_id])

    @picture = Picture.find(params[:comment][:picture_id])

    if @comment.save
      redirect_to picture_path(@picture)
    else
      render :new
    end
    
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :picture_id, :user_id)
  end
end
