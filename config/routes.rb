Rails.application.routes.draw do
  get 'likes/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :users, only: [:show]
  
  resources :topics do
    resources :bookmarks, except: [:index] do
      resources :likes, only: [:index, :create, :destroy]
    end
  end

  post :incoming, to: 'incoming#create'


  get 'welcome/index'
  get 'welcome/about'

  root to: 'welcome#index'

end
