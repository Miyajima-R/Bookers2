Rails.application.routes.draw do

  get 'homes/top'
  get 'homes/about'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get 'homes/about' => 'homes#about'

  resources :users, only: [:index, :show, :edit, :update,:destroy]
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy]
#
end
