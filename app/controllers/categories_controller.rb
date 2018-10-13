class CategoriesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @recipes = []
    
    @keyword = params[:keyword]
    if @keyword.present?
      results =  RakuteWebService::Ichiba::Item.search({
        keyword: @keyword,
        imageFlag: 1,
        hits: 20,
      })
      
      results.each do |result|
        recipe = Recipe.new(read(result))
        @recipes << recipe
      end
    end
  end
  
  private
  
  def read(result)
    code = result['recipeCode']
    name = result['recipeName']
    recipe_url = result['recipeUrl']
    image_url = result['mediumImageUrls'].first['imageUrl'].gsub('e_ex=128x128', '')
    
    {
      code: code,
      name: name,
      recipe_url: recipe_url,
      image_url: image_url,
    }
  end
end
