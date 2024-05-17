Rails.application.routes.draw do
  devise_for :users
  root to:"prototypes#index"

  resources :users
  resources :prototypes
  resources :comments, only: [:create]
end