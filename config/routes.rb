Rails.application.routes.draw do

  root 'page#index'
  get '/admin_panel' => 'users#admin_panel'
  get '/secret' => 'page#secret'
  get '/register' => 'users#new'
  resources :users

  #routes for login form/login in/logging out
  get 'login' => 'sessions#new'

  post '/login'=> 'sessions#create'

  get '/logout' => 'sessions#destroy'

  #routes for startups
  resources :startups
  get '/startups' => 'startups#index'
  #approving startups
  patch '/startups/:id/approve' => 'startups#approve', as: 'startup_approve'
  #routes for investors
  resources :investors
  get '/investors' => 'investors#index'
  #approving investors
  patch '/investors/:id/approve' => 'investors#approve', as: 'investor_approve'
 
end
