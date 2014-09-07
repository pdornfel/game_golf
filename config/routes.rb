Rails.application.routes.draw do
  resources :players
  resources :tournaments
  resources :picks
  resources :users
  resources :results
end
