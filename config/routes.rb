Rails.application.routes.draw do
  
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :users, except: %i[create]
      post '/signup', to: 'users#create'

      post '/login', to: 'authentication#login' 
    end
  end


  devise_for :users
 

  get 'home/index'
 

  root to: "home#index"


end
