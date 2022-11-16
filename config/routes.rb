Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # # to see the list of all restaurants
  # GET '/restaurants', to: 'restaurants#index'

  # # A visitor can add a new restaurant, and be redirected to the show view of that new restaurant.
  # GET '/restaurants/new', to: 'restaurants#new', as: 'new_restaurant'
  # POST '/restaurants', to: 'restaurants#create'

  # # A visitor can see the details of a restaurant, with all the reviews related to the restaurant.
  # GET '/restaurants/:id', to: 'restaurants#show', as: 'restaurant'

  # # A visitor can add a new review to a restaurant
  # GET '/restaurants/:id/reviews/new', to: 'reviews#new', as: 'new_review'
  # POST '/restaurants/:id/reviews', to: 'reviews#post'

  # This above is the same as:
  resources :restaurants, only: [:index, :new, :create, :show] do
    resources :reviews, only: [:create] # REFACTORED, :new] # index nas reviews não tem sentido
  end
  # resources :reviews, only: [:show] # if show was needed it would be outside the loop
end
