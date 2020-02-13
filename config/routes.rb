Rails.application.routes.draw do
  root "sessions#home"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :games do
    resources :notes, only: [:new, :create]
  end

  resources :notes, only: [:edit, :update, :delete]

  resources :users do
    # resources :owned_games, only: [:index, :create], as: 'collection'
    get '/collection', to: 'owned_games#index'
    get '/collection/add_game', to: 'owned_games#new'
    post '/collection', to: 'owned_games#create'
    get '/account', to: 'users#edit'
  end

  delete '/collection/:id', to: 'owned_games#destroy', as: 'collection/remove_game'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
