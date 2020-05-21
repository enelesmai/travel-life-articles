Rails.application.routes.draw do
  root 'travels#index'

  resources :travels, only: [:new, :create, :show, :index]
  resources :categories, only: [:new, :create, :show, :index]
  resources :votes, only: [:new, :create]
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  
  get 'sign_up', to: 'users#new', as: 'sign_up'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
