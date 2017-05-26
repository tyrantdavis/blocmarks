Rails.application.routes.draw do
 resources :topics do
   resources :bookmarks
 end

  post :incoming, to: 'incoming#create'
  
  devise_for :users
  get 'welcome/index'
  get 'welcome/about'

  root to: 'welcome#index'

end
