Rails.application.routes.draw do
  post 'comments/create'
  post 'comments/destroy'
  patch 'comments/update'
  post 'likes/create'
  post 'likes/destroy'
  get 'users/show'
  get 'users/index'
  devise_for :users
  resources :users do 
    get 'page/:page', action: :index, on: :collection
  end
  resources :posts do
    delete :destroy, on: :member
    get '/page/:page', action: :index, on: :collection
  end
  post 'invitations/create'
  post 'invitations/destroy'
  post 'invitations/update'
  root 'posts#index'
end
