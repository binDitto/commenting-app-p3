class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in? #makes these methods available to views.

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # current_user returns @current_user
    # if @current_user is not yet defined, then @current_user = User.find(...)
    # which is then also returned to current_user method
  end

  def logged_in?
    !!current_user
    # the double bang! turns it into a boolean true or false.
  end

  def require_user
    # restrict controller actions by checking if user is logged_in?
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
end
