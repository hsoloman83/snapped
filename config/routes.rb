Rails.application.routes.draw do
  resources :users
  resources :pictures
  resources :tags
  post 'users/new', to: 'users#create'
end
