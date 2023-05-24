Rails.application.routes.draw do

  # get 'restaurants', to: 'restaurants#index', as: 'restaurants'
  # get 'restaurants/:id', to: 'restaurants#show', as: 'restaurant'
  
  # get 'restaurants/new', to: 'restaurants#new', as: 'new_restaurant'
  # post 'restaurants', to: 'restaurants#create'
  
  # ....
  resources :restaurants do
    # '/restaurants/:id/reviews/new'
    resources :reviews, only: [:new, :create, :show]
    
    collection do 
      # get 'restaurants/top'
      # 'restaurants
      get :top
    end
    
    member do
      # 'restaurants/:id/'
      # '/restaurants/:id/reviews/new'
      # get 'reviews/new', to: 'reviews#new', as: "new_restaurant_review"
      # get 'restaurants/:id/chef
      get :chef
      # get "review/new
    end
  end

  resources :reviews, only: [:destroy]
end
