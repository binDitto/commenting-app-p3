class UsersController < ApplicationController
  before_action :set_user, only: [ :edit, :update, :show, :destroy ]
  before_action :require_user, only: [ :edit, :update, :destroy ]

  def index
    @users = User.all

    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.all.order('created_at DESC')
    end
  end

  def signup
    @newuser = User.new()
  end

  def create
    @newuser = User.new(signup_params)
    if @newuser.save
      session[:user_id] = @newuser.id
      flash[:success] = "Welcome #{@newuser.username}, rad name!"
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

    if @user.save
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
    session[:user_id] = nil
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
