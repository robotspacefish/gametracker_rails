Rails.application.routes.draw do
  root "sessions#home"

  get '/auth/:provider/callback', to: 'sessions#omniauth'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # had to separate this because it wasn't showing up when it was part of resources :notes
  resources :notes, only: [:edit, :update, :destroy]

  resources :games do
    resources :owned_games, only: [:new, :create]
    resources :notes, only: [:new, :create]
  end

  resources :owned_games, except: [:index, :show, :new, :create]

  resources :users do
    resources :games, only: [:index]

    get '/account', to: 'users#edit'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
