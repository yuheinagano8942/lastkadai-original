class RankingsController < ApplicationController
  def popular_recipe
    @recipes= RakutenWebService::Recipe.ranking("30")
  end
  
  def ricerecipe
     @recipes = RakutenWebService::Recipe.ranking("14")
  end

  
  def eggrecipe
    @recipes = RakutenWebService::Recipe.ranking("33")
  end
end