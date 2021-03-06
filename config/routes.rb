Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "posts#index"

  resources :posts do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:create, :destroy]
  end

  resources :accounts, only: [:show] do
    member do
      get :followings, :followers
    end
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end

  resource :profile, only: [:show, :edit, :update]
  resources :favorites, only: [:index]
end
