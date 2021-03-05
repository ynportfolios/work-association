Rails.application.routes.draw do
  root 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :blogs
  resources :users, only: [:new, :create, :show]
end
