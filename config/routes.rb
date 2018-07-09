Rails.application.routes.draw do
  resources :users
  resources :pictures
  resources :tags
  resources :sessions
  post 'users/new', to: 'users#create'
end
