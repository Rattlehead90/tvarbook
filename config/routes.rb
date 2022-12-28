Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :users, only: [:show]
  resources :posts
  post 'invitations/create'
  post 'invitations/destroy'
  post 'invitations/update'
  root 'posts#index'
end
