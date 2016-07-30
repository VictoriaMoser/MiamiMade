Rails.application.routes.draw do
  # get 'investor/index'
  #
  # get 'investor/new'
  #
  # get 'investor/create'
  #
  # get 'investor/edit'
  #
  # get 'investor/destroy'


  # get 'startup/new'
  #
  # get 'startup/create'
  #
  # get 'startup/edit'
  #
  # get 'startup/destroy'

  # root ''
  # root (pages home)

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
    get '/startup/index' => 'startups#index'

end
