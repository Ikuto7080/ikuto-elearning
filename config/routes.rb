Rails.application.routes.draw do

  

  namespace :admin do
    resources :categories do
      resources :words do
        resources :choices
      end
    end
  end

  
  
  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'

  root 'static_pages#home'
 
 
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  resources :users
  get '/signup', to: 'users#new'
 
 end
