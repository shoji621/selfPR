Rails.application.routes.draw do
  devise_for :users
  root "posts#index" 

  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    member do
      get :follows
      get :followers
      get :favorite
    end
  end

  namespace :posts do
    resources :searches, only: :index
  end
  namespace :posts do
    resources :solveds, only: :update
  end
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

end