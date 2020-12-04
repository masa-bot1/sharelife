Rails.application.routes.draw do
  get 'top/index'
  get 'users/show'
  devise_for :users
  root to: 'services#index'
  resources :services do
    resources :orders, only: [:index, :create]
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
    member do
      get 'select_category_index'
    end
  end
  resources :users, only: [:show, :update]
end
