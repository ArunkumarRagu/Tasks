Rails.application.routes.draw do
  devise_for :users
  root 'registration#index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  get 'personal', to: 'registration#personal'
  post 'personal', to: 'registration#create_personal'
  
  get 'address', to: 'registration#address'
  post 'address', to: 'registration#create_address'
  
  get 'official', to: 'registration#official'
  post 'official', to: 'registration#create_official'
  
  get 'search', to: 'registration#new_search', as: :search_value


end
