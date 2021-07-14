Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'homes/about' => 'homes#about'

  resources :books, only: [:new, :create, :index, :show,:edit, :update, :destroy]
  resources :users, only: [:index, :show, :create, :edit, :update]
end
