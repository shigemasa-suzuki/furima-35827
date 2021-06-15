Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users
  root to: "items#index"
  resources :items do
   resources :messages, only: :create
end
  resources :items do
    resources :orders, only: [:index,:create]
end
end