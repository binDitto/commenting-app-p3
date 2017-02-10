Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  resources :users, except: [ :new ] do
    resources :comments, except: [ :new, :create ]
  end

  get 'comments', to: 'comments#comments'
  post 'comments', to: 'comments#create'

  get 'signup', to: 'users#signup'
  post 'signup', to: 'users#create'

  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  delete 'login', to: 'sessions#logout'
end
