Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  root 'static_pages#home'
 
 
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  resources :users
  get '/signup', to: 'users#new'
 
 end
