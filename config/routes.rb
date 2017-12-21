Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
    end
  end

  resources :microposts, only: [:create, :destroy]
  
#いいね周りのルーティング
  resources :likes, only: [:create, :destroy] do
   member do
     get :like_users
     get :like_microposts
   end
  end
  
  resources :relationships, only: [:create, :destroy]
end
