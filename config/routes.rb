Rails.application.routes.draw do

  # Routes for sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  delete 'session', to: 'sessions#destroy'

  resource :users, only: %i[new create]
  resources :games
  resources :companies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
