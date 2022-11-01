# frozen_string_literal: true

Rails.application.routes.draw do
  resources :dog_foods
  resources :foods
  resources :dogs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'home', to: 'application#home'
  get 'application', to: 'application#_navbar'
  get 'about', to: 'application#about'
  get 'dogs', to: 'dogs#show'
  get 'search', to: 'dogs#show'
  root 'dogs#index'
end
