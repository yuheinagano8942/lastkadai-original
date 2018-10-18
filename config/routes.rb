Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'rankings/popular_recipe', to: 'rankings#popular_recipe'
  get 'rankings/eggrecipe', to: 'rankings#eggrecipe'
  get 'rankings/ricerecipe', to: 'rankings#ricerecipe'
  


  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
  resources :likes, only: [:create, :destroy]
  resources :recipes
end
