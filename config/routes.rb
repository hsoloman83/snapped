Rails.application.routes.draw do

  # get '/', to: 'sessions#new'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  post 'pictures/new', to: 'pictures#create'
  post 'session/new', to: 'sessions#create'
  post '/pictures/comments', to: 'comments#create'
  post '/comments/comments', to: 'comments#destroy'

  get '/users/pictures/new', to: 'pictures#new'
  post '/users/pictures/new', to: 'pictures#create'

  get '/pictures/comments', to: 'comments#new'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  post '/users/sessions', to: 'sessions#destroy', as: '/logout'


  resources :sessions
  resources :comments
  resources :picture_tags
  resources :tags
  resources :pictures
  resources :users

end
