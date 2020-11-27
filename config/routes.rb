Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'services#index'
  resources :services do
    resources :orders, only: [:index, :create]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :update]
end
