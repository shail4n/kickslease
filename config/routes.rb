Rails.application.routes.draw do
  devise_for :users
  root to: "shoes#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :shoes do
    resources :bookings, only: [ :new, :create ]
  end
  resources :bookings, only: [ :index, :destroy ]
  resources :users, only: :show
end
