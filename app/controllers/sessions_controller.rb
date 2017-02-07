class SessionsController < ApplicationController
  def login

  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    # sets the user variable to find User by username which is added in the session controller login action form
    # username is whatever is passed in for :session's :username and then downcased

    if user && user.authenticate(params[:session][:password])
      # if the set user, and that user's password is the same as what's passed into the session password
      # then ok the authentication and save the user's id found above User.find_by, to the session's user_id
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to root_path
    else
      flash.now[:danger] = "There was something wrong with your login information"
      render 'login'
    end
  end

  def logout
    # simply erase the saved user_id in session[:user_id] by setting it to nil.
    session[:user_id] = nil
    flash[:success] = "You'ved logged out!"
    redirect_to root_path
  end
end
