Rails.application.routes.draw do
  post 'likes/create'
  post 'likes/destroy'
  get 'users/show'
  devise_for :users
  resources :users, only: [:show]
  resources :posts
  post 'invitations/create'
  post 'invitations/destroy'
  post 'invitations/update'
  root 'posts#index'
end
