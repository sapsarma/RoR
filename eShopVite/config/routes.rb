EShopVite::Application.routes.draw do
  get "sessions/new"

  resources :itemfriends


  resources :userfriends

get "log_out" => "sessions#destroy", :as => "log_out"
get "log_in" => "sessions#new", :as => "log_in"
get "sign_up" => "users#new", :as => "sign_up"
root :to => "sessions#new"

match "/auth/:provider/callback" => "sessions#create"
match "/signout" => "sessions#destroy", :as => :signout


resources :users 
  resources :itemservices
resources :sessions


   resources :itemservices do
       resources :itemfriends
   end


  # Sample of named route:
     match 'itemfriends/new/:itemservice_id' => 'itemfriends#new'
end
