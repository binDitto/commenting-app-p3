class UsersController < ApplicationController
  before_action :set_user, only: [ :edit, :update, :show, :destroy]
  before_action :require_user, except: [ :index, :signup, :show ]
  def index
    @users = User.all
  end

  def signup
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Welcome #{@user.username}!"
      redirect_to root_path
    else
      render 'signup'
    end
  end

  def edit

  end

  def update
    @user.update(edit_user_params)

    if @user.save
      flash[:success] = "Info updated!"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def show

  end

  def destroy

    @user.destroy

    if @user.destroy
      flash[:danger] = "User deactivated"
      redirect_to root_path
    else
      render 'destroy'
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

    def edit_user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
