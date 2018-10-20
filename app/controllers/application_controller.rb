class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper

  private
  
  def counts(user)
    @count_likes = user.likes_recipes.count
  end

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end