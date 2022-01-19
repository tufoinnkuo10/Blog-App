# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'users/index'
  # resources :posts
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show]
  end

  # root to: 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
