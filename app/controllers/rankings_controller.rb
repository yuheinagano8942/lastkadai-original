class RankingsController < ApplicationController
  def popular_recipe
    @recipes = []
    results = RakutenWebService::Recipe.ranking("30")
    results.each do |result|
      recipe = Recipe.find_or_create_by(read(result))
      @recipes << recipe
    end
  end
  
  def ricerecipe
    @recipes = []
     results = RakutenWebService::Recipe.ranking("14")
     results.each do |result|
      recipe = Recipe.find_or_create_by(read(result))
      @recipes << recipe
    end
  end

  
  def eggrecipe
    @recipes = []
    results = RakutenWebService::Recipe.ranking("33")
    results.each do |result|
      recipe = Recipe.find_or_create_by(read(result))
      @recipes << recipe
    end
  end
  
  private
  
  def read(result)
    code = result['recipeId']
    name = result['recipeTitle']
    url = result['recipeUrl']
    image_url = result['mediumImageUrl']
    
    {
      code: code,
      name: name, 
      url: url,
      image_url: image_url
    }
  end
end