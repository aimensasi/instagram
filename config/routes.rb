Rails.application.routes.draw do

  get "/discovery" => "discovery#index"
  get "/search" => "discovery#search"


  post 'sessions/' => 'sessions#create'
  delete '/log_out' => 'sessions#destroy'

	get "/sign_up" => "users#new"
  
  resources :users, :except => [:new] do
    resources :relations, :only => [:create, :destroy]
  end
  
  resources :posts do 
  	resources :comments, :only => [:create]
  	resources :likes, :only => [:create, :destroy]
  end
  
  root "posts#index"
end
