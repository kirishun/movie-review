Rails.application.routes.draw do

  devise_for :users
  root 'movies#index'

  resources :movies do
    resources :reviews
    collection do
      get 'search'
    end
  end
  
  resources :users, only: [:edit, :update]
end
