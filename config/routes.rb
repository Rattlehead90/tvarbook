Rails.application.routes.draw do
  post 'comments/create'
  post 'comments/destroy'
  patch 'comments/update'
  post 'likes/create'
  post 'likes/destroy'
  get 'users/show'
  devise_for :users
  resources :users, only: [:show]
  resources :posts do
    delete :destroy, on: :member
  end
  post 'invitations/create'
  post 'invitations/destroy'
  post 'invitations/update'
  root 'posts#index'
end
