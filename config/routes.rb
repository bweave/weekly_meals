require 'sidekiq/web'

Rails.application.routes.draw do
  namespace :admin do
    resources :announcements
    resources :notifications
    resources :services
    resources :users

    root to: "users#index"
  end

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  get "/menu", to: "menu#new"
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'

  resources :announcements, only: [:index]
  resources :meals
  resources :notifications, only: [:index]

  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
