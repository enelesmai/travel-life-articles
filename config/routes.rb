# frozen_string_literal: true

Rails.application.routes.draw do
  root 'travels#index'

  resources :travels, only: %i[new create show index]
  resources :categories, only: %i[new create show index]
  resources :comments, only: [:create]
  resources :votes, only: %i[new create]
  resources :users, only: %i[new create]
  resources :sessions, only: %i[new create destroy]

  get 'sign_up', to: 'users#new', as: 'sign_up'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
