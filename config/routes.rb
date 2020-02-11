Rails.application.routes.draw do
  root "sessions#home"

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :notes, only: [:new, :create, :edit, :destroy]

  # resources :genres
  # resources :images
  # resources :platforms


  resources :games

  resources :users do
    # resources :collections, only: [:index]
    get '/collection', to: 'owned_games#index'
    get '/account', to: 'users#edit'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
