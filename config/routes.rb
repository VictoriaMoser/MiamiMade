Rails.application.routes.draw do
  root '/'

  get 'page#index'

  get '/secret' => 'page#secret'
  get '/register' => 'users#new'

  #routes for login form/login in/logging out
  get 'login' => 'sessions#new'

  post '/login'=> 'sessions#create'

  get '/logout' => 'sessions#destroy'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
