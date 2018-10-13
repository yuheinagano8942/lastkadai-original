class RankingsController < ApplicationController
  def popular_recipe
    @recipes = RakutenWebService::Recipe.ranking("30")
    
    results.each do |result|
      recipe = Recipe.new(read(result))
      @recipes << recipe
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
  
  def eggrecipe
    @recipes = RakutenWebService::Recipe.ranking("33")
  end
  
  def ricerecipe
     @recipes = RakutenWebService::Recipe.ranking("14")
  end
  end
end