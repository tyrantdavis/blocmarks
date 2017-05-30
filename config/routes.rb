Rails.application.routes.draw do

  get 'bookmarks/show'

  get 'bookmarks/new'

  get 'bookmarks/edit'

    devise_for :users
    
    resources :topics do
      resources :bookmarks
    end

  post :incoming, to: 'incoming#create'


  get 'welcome/index'
  get 'welcome/about'

  root to: 'welcome#index'

end
