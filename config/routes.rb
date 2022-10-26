Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/register', to: 'users#new'
  post '/users', to: 'users#create'
end
