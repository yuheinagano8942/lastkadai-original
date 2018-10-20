class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @recipe = Recipe.find(params[:recipe_id])
    current_user.like(@recipe)
    flash[:success] = 'お気に入りに追加しました。'
    redirect_to @recipe
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    current_user.unlike(@recipe)
    flash[:success] = 'お気に入りを解除しました'
    redirect_to @recipe
  end
end