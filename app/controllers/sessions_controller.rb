class SessionsController < ApplicationController

  def login
     session[:user_id] = nil
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have signed in!"
      redirect_to root_path
    else
      flash[:danger] = "Your sign in info is wrong!"
      render 'login'
    end

  end

  def logout
    session[:user_id] = nil
    flash[:success] = "You've successfully logged out!"
    redirect_to login_path
  end

end
