Rails.application.routes.draw do
  devise_for :users
  resources :categories do
    resources :expenses, only: %i[index]
  end

  resources :expenses, only: %i[create update destroy new]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "splash#index"
end

