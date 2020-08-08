Rails.application.routes.draw do
  get 'users/index'
  get 'items/index'
  devise_for :users
  root "items#index"

end
