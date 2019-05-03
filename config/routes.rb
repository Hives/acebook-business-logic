# frozen_string_literal: true

Rails.application.routes.draw do
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:create]
  resources :posts, only: [:new, :edit, :create, :update, :destroy]

  root "users#new"

  get "/:username", to: "posts#index"
end
