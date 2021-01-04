Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'services#index'
  resources :services do
    resources :orders, only: [:index, :create]
    collection do
      get 'search'
    end
    member do
      get 'select_category_index'
    end
  end
  post '/services/guest_sign_in', to: 'services#new_guest'
  resources :users, only: [:show, :edit, :update]
  post   '/like/:service_id' => 'likes#like',   as: 'like'
  delete '/like/:service_id' => 'likes#unlike', as: 'unlike'
end
