Rails.application.routes.draw do
  # get 'users/index'
  # resources :posts
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
