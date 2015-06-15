Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :rewards, only: [:index]
  
  namespace :admin do 
    resources :users
    resources :rewards
  end
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
  
