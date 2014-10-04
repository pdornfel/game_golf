Rails.application.routes.draw do

  root to: 'users#index'

  get 'logout' => 'sessions#destroy', as: 'logout'
  get 'login' => 'sessions#new', as: 'login'
  get 'signup' => 'users#new', as: 'signup'


  resources :players
  resources :tournaments
  resources :picks
  resources :users
  resources :sessions
  resources :results
end
