class CommentsController < ApplicationController
  before_action :require_user, only: [ :edit, :update, :destroy]
  def comments
    @comments = Comment.all.order("created_at DESC")
    if logged_in?
      @user = User.find(session[:user_id])
      @comment = @user.comments.new()
    end
    if params[:search]
      @comments = Comment.search(params[:search]).order("created_at DESC")
    end

  end

  def index
    @user = User.find(params[:user_id])
    @comments = @user.comments.order("created_at DESC")

    if !@user.comments.any?
      redirect_to users_path
      flash[:danger] = "User has no comments"
    end
  end

  def new

  end

  def create
    @user = User.find(session[:user_id])
    @comment = @user.comments.create(comment_params)

    if @comment.save
      flash[:success] = "Thanks for commenting!"

      redirect_to comments_path
    else
      flash[:danger] = "Comment failed to go through!"
      redirect_to comments_path
    end
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
