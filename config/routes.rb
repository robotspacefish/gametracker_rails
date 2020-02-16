Rails.application.routes.draw do
  root "sessions#home"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  # had to separate this because it wasn't showing up when it was part of resources :notes
  delete '/notes/:id', to: 'notes#destroy'
  resources :notes, only: [:edit, :update]

  get '/games/:id/add_to_collection', to: 'owned_games#new', as: 'add_to_collection'

  resources :games do
    resources :notes, only: [:new, :create]
    # get '/collection/:id/edit', to: 'owned_games#edit', as: 'collection/edit_ownership'
    # resources :owned_games_platforms, only: :edit
  end

  # resources :owned_games_platforms, only: [:edit, :update]
  resources :owned_games, only: [:edit, :update]


  resources :users do
    # resources :owned_games, only: [:index, :create], as: 'collection'
    resources :games, only: [:index]

    get '/account', to: 'users#edit'
  end

  patch '/collection/:id', to: 'owned_games#update'
  delete '/collection/:id', to: 'owned_games#destroy', as: 'collection/remove_game'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
