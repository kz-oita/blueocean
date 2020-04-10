Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts do
    resources :comments, only: :create
    collection do
      get 'search'
    end
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update] 
  resources :tags, only: [:index, :show]
  resources :relationships, only: [:create, :destroy]



end
