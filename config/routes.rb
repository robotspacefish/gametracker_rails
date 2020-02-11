Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  # resources :notes
  # resources :genres
  # resources :images
  # resources :platforms


  resources :games

  resources :users do
    # resources :collections, only: [:index]
    get '/collection', to: 'owned_games#index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
