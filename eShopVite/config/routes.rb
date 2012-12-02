EShopVite::Application.routes.draw do

  resources :itemfriends

  root :to => "itemservices#index"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}

  devise_scope :user do
     get "sign_in", :to => "devise/sessions#new"
     get "/", :to => "devise/sessions#new"
     get "sign_out", :to => "devise/sessions#destroy"
     get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end



  resources :itemservices

   resources :itemservices do
       resources :itemfriends
   end

 # match 'itemfriends/new/:itemservice_id'          => 'itemfriends#new'
   match 'itemfriends/new/:itemservice_id/with_emaild/:emailid' => 'itemfriends#new'

end
