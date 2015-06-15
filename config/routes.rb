Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :rewards, only: [:index] do
    post '/user_rewards', to: 'user_rewards#create' 
  end
  
  namespace :admin do 
    resources :users
    resources :rewards
  end
  
  namespace :user do
    resources :rewards, only: [:index]
  end
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
  
