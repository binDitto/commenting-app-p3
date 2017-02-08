Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#index'
  resources :users, except: [ :index, :new ]

  get 'signup', to: 'users#signup'

  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  delete 'login', to: 'sessions#logout'
end
