Rails.application.routes.draw do
  get 'likes/create'
  root 'users#index'
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show] do
    end
  end

  resources :posts, only: %i[new create] do
    resources :comments
    resources :likes
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
