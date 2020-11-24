Rails.application.routes.draw do
  devise_for :users
  root to: 'services#index'
  resources :services do
    resouces :orders, only: [:index, :create]
  end
end
