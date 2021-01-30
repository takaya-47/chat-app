Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:edit, :update] # devise_for :usersでは定義されていない部分のルーティングを補う
  resources :rooms, only: [:new, :create] do # どのルームで投稿されたメッセージなのかをパスから判断できるようにしたいのでルーティングのネストを利用
    resources :messages, only: [:index, :create]
  end
end
