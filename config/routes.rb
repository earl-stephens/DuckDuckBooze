Rails.application.routes.draw do
  root 'home#index'

  resources :items, only: [:index, :show, :create]


  namespace :admin do
    resources :merchants, only: [:show, :update, :index]
    resources :users, only: [:show, :index, :update, :new]
    get '/dashboard', to: 'dashboard#show'
  end

  namespace :dashboard do
    resources :items
    resources :orders, only: [:show]
    get '/', to: 'merchants#show'
  end

  resources :carts, only: [:create]

  resources :users, only: [:new, :create]

  namespace :users do
    resources :orders, only: [:update]
  end

  get '/profile/orders/:id', to: 'users/orders#show', as: :profile_order
  get '/profile/orders', to: 'users/orders#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/cart', to: 'carts#show'
  get '/cart/empty', to: 'carts#destroy'

  get '/profile', to: 'users#show'
  get '/profile/edit', to: 'users#edit'
  post '/profile/edit', to: 'users#update'

  get '/merchants', to: 'merchants#index'
end
