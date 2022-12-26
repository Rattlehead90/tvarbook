Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :users, only: [:show]
  post 'invitations/create'
  root 'posts#index'
end
