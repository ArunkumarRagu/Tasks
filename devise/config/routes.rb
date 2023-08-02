Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  get 'index', to: 'pages#index'
  get 'login', to: 'pages#login'
  get 'logout', to: 'pages#logout'

  # Defines the root path route ("/")
  # root "articles#index"
end
