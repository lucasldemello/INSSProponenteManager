require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  post 'inss_discount/calculate'
  resources :proponents, only: [:index, :create, :new, :update, :edit, :destroy]

  root "proponents#index"
end
