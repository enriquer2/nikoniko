Rails.application.routes.draw do
  devise_for :users, path_names: { sign_up: 'register' }
  resources :teams
  resources :feelings
  resources :users
  resources :welcomes, only: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#index'
end
