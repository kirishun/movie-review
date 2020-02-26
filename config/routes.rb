Rails.application.routes.draw do

  devise_for :users
  root 'movies#index'

  resources :movies do
    resources :reviews
  end
  
  resources :users, only: [:edit, :update]
end
