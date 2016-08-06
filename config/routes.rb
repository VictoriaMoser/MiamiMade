Rails.application.routes.draw do

  post '/filter' => 'page#filter'
  get '/vertical-search' => 'page#vertical_search'
  root 'page#index'
  get '/search' => 'page#search'
  get '/admin_panel' => 'users#admin_panel'
  get '/secret' => 'page#secret'
  get '/register' => 'users#new'
  # resources :users, except: :index

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

  #user approval
  patch '/users/:id/approve' => 'users#approve', as: 'user_approve'
  #validating user email
  resources :users, except: :index do
    member do
     get :confirm_email
   end
 end

end
