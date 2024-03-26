require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  post 'inss_discount/calculate'

  resources :proponents, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  patch '/proponents/:id', to: 'proponents#update', as: 'update_proponent'

  get 'proponents_report', to: 'proponents#report'

  root "proponents#index"
end
