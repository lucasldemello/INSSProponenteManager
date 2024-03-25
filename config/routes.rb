require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :proponents, only: [:index, :create, :new, :update, :destroy]

  # Defines the root path route ("/")
  root "proponents#index"
end
