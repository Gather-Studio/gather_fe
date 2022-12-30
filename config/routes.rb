Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/register', to: 'users#new'
  post '/users', to: 'users#create'
  get '/dashboard', to: 'users#show'

  get '/logout', to: 'sessions#destroy' #can't get this button to route correctly with bootstrap/delete verb...will come back to it.
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
end
