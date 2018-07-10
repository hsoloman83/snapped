Rails.application.routes.draw do
  resources :users
  resources :pictures
  resources :tags
  resources :sessions

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  post '/pictures/comments', to: 'comments#create'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

end
