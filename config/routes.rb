Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  root to: "rooms#index"
  resources :users, only: [:edit, :update] # devise_for :usersでは定義されていない部分のルーティングを補う
  resources :rooms, only: [:new, :create]
end
