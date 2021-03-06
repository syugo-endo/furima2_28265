Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :users, only: [:new, :create, :destroy, :show]
  resources :items
  resources :deliver_addresses, only: [:index, :show, :create]
end
