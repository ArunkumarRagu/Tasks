Rails.application.routes.draw do
  root 'pages#home'
  get 'home', to: 'pages#home'
  get 'b2b', to: 'pages#b2b'
  get 'history', to: 'pages#history'
  get 'profile', to: 'pages#profile'
  get 'login', to: 'pages#login'
  # get 'b2b', to: 'pages#b2b'
  # get 'pages/b2b'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
