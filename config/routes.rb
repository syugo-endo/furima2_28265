Rails.application.routes.draw do
  get 'items/index'
  # get 'users/index'
  devise_for :users
  root "items#index"
end
