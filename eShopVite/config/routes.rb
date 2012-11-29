EShopVite::Application.routes.draw do

#  devise_for :users
  #get "sessions/new"
  resources :itemfriends

  resources :userfriends

  #get "log_out" => "sessions#destroy", :as => "log_out"
  #get "log_in" => "sessions#new", :as => "log_in"
  #get "sign_up" => "users#new", :as => "sign_up"
  root :to => "itemservices#index"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}

devise_scope :user do
  get "sign_in", :to => "devise/sessions#new"
  get "/", :to => "devise/sessions#new"
  get "sign_out", :to => "devise/sessions#destroy"
  get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
end

  #match "/auth/:provider/callback" => "sessions#create"
  #match "/signout" => "sessions#destroy", :as => :signout


  resources :itemservices
  #resources :sessions


   resources :itemservices do
       resources :itemfriends
   end


  # Sample of named route:
     match 'itemfriends/new/:itemservice_id' => 'itemfriends#new'
end
