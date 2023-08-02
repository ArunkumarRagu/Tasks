Rails.application.routes.draw do
  devise_for :users
  root 'registration#index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  get 'personal_details', to: 'registration#personal'
  post 'personal_details', to: 'registration#create_personal'
  
  get 'address_details', to: 'registration#address'
  post 'address_details', to: 'registration#create_address'
  
  get 'official_details', to: 'registration#official'
  post 'official_details', to: 'registration#create_official'
  
  get 'search', to: 'registration#new_search', as: :search_value


end
