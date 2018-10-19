Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'rankings/popular_recipe', to: 'rankings#popular_recipe'
  get 'rankings/eggrecipe', to: 'rankings#eggrecipe'
  get 'rankings/ricerecipe', to: 'rankings#ricerecipe'
  get 'rankings/fishrecipe', to: 'rankings#fishrecipe'
  get 'rankings/meatrecipe', to: 'rankings#meatrecipe'
  get 'rankings/pastarecipe', to: 'rankings#pastarecipe'
  


  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create, :destroy] do
    member do
      get :likes
    end
  end
  
  resources :likes, only: [:create, :destroy]
  resources :recipes
end
