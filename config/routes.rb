Rails.application.routes.draw do

  resources :relations
  post 'sessions/' => 'sessions#create'
  delete '/log_out' => 'sessions#destroy'

	get "/sign_up" => "users#new"
  
  resources :users, :except => [:new]
  
  resources :posts do 
  	resources :comments, :only => [:create]
  	resources :likes, :only => [:create, :destroy]
  end
  
  root "posts#index"
end
