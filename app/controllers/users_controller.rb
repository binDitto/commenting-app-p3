class UsersController < ApplicationController
  before_action :set_user, only: [ :edit, :update, :show, :destroy ]
  before_action :require_user, only: [ :edit, :update, :destroy ]

  def index
    @users = User.all
  end

  def signup
    @newuser = User.new()
  end

  def create
    @newuser = User.new(signup_params)

    if @newuser.save
      flash[:success] = "Welcome #{@user.username}, rad name!"
      redirect_to root_path
    else
      flash[:danger] = "Signup failed.. it wasn't meant to be man. Try again?"
      render 'signup'
    end
  end

  def edit
  end

  def update
    @user.update(edit_params)

    if @user.update
      flash[:success] = "Info updated"
      redirect_to root_path
    else
      flash[:danger] = "Can't update info"
      render 'edit'
    end
  end

  def show

  end

  def destroy
    @user.destroy
    flash[:danger] = "Your account is officially deactivated!"
    redirect_to root_path
  end

  private

    def signup_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end


    def edit_params
      params.require(:user).permit(:username, :email, :password)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
