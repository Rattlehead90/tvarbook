Rails.application.routes.draw do
  get 'users/show'
  resources :posts
  devise_for :users
  resources :users, only: [:show]

  root 'posts#index'
end
