Rails.application.routes.draw do

  
  get '/dashboard', to: 'dashboard#home'
  resources :relationships, only: [:create, :destroy]
  resources :users do
    member do
      get :following, :followers
    end
  end

  namespace :admin do
    resources :categories do
      resources :words do
        resources :choices
      end
    end
  end

  resources :categories, only: [:index] do
    resources :lessons, only: [:new, :create, :show] do
      resources :answers
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
