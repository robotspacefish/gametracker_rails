Rails.application.routes.draw do
  resources :notes
  resources :genres
  resources :images
  resources :platforms
  resources :games
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
