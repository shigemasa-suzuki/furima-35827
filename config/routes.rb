Rails.application.routes.draw do
  get 'cards/new'
  get 'users/show'
  get 'messages/new'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'streets', to: 'users/registrations#new_streeet'
    post 'streets', to: 'users/registrations#create_street'
  end
  root to: "items#index"
  resources :items do
   resources :messages, only: :create
   resources :orders, only: [:index,:create]
   collection do
    get 'search'
    get 'research'
   end
  end
  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create]
  resources :items, only: :order do
    post 'order', on: :member
  end
end