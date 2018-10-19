class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    user = User.find(params[:recipe_id])
    current_user.recipe(user)
    flash[:success] = 'お気に入りに追加しました。'
    redirect_to user 
  end

  def destroy
    user = User.find(params[:recipe_id])
    current_user.unrecipe(user)
    flash[:success] = 'お気に入りを解除しました'
    redirect_to user
  end
end
