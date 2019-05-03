# frozen_string_literal: true

Rails.application.routes.draw do
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :create]
  resources :posts, only: [:new, :edit, :create, :update, :destroy]
  root "users#new"

  get "/:user_id", to: "posts#index", constraints: { user_id: /\d+/ }
  get "/:username", to: "posts#index"
end
