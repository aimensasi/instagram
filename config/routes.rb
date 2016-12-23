Rails.application.routes.draw do

  
  
  post 'sessions/' => 'sessions#create'
  delete '/log_out' => 'sessions#destroy'

	get "/sign_up" => "users#new"
  
  resources :users, :except => [:new]
  
  resources :posts
  root "posts#index"
end
