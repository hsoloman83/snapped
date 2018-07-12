class CommentsController < ApplicationController
  def index
    @comments = Picture.all
  end

  def show
    @comment = Comment.find(params[:id])
    @user = User.find(comment[:user_id])
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
      flash[:errors] = "No Comment Entered, Please Try Again"
      redirect_to picture_path(@picture)
    end

  end

  def edit
    @comment = Comment.find(params[:id])
    @user = User.find(comment[:user_id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @comment
    else
      render :edit
    end
  end


  def destroy
    @comment = Comment.find(params[:id])
    @picture = Picture.find(@comment.picture_id)
    @comment.destroy
    redirect_to @picture
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :picture_id, :user_id)
  end
end
