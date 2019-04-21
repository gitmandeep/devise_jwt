Rails.application.routes.draw do
  
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :posts, only: %i[index]
      resources :users
      post '/signup', to: 'authentication#login' 
    end
  end


  devise_for :users
 

  get 'home/index'
 

  root to: "home#index"


end
