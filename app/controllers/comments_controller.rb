class CommentsController < ApplicationController

  def comments
    @comments = Comment.all.order("created_at DESC")
    @user = User.find(session[:user_id])
    @comment = @user.comments.new()

    if params[:search]
      @comments = Comment.search(params[:search]).order("created_at DESC")
    end

  end

  def index
    @user = User.find(params[:user_id])
    @comments = @user.comments
  end

  def new

  end

  def create
    @user = User.find(session[:user_id])
    @comment = @user.comments.create!(comment_params)
    redirect_to comments_path
  end

  def edit
    @user = User.find(params[:user_id])
    @comment = @user.comments.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @comment = @user.comments.find(params[:id])
    @comment.update(comment_params)

    if @comment.save
      redirect_to user_comments_path(@user, @comment)
    end
  end

  def show

  end

  def destroy

  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end