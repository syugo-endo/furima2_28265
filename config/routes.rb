Rails.application.routes.draw do
  get 'users/index'
  get 'items/index'
  post 'items/new'
  devise_for :users
  root "items#index"
  resources :users, only: [:new, :create, :destroy]
  resources :items, only: [:new, :create]
end
