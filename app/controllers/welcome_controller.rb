class WelcomeController < ApplicationController
  def index

    @comments = Comment.all.order("created_at DESC").limit(1)

    if logged_in?
      redirect_to users_path
    end
  end

end
