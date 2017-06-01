Rails.application.routes.draw do
  get 'inventories/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
    devise_scope :user do
    get "signup", to: "devise/registrations#new"
    get "login", to: "devise/sessions#new"
    get "logout", to: "devise/sessions#destroy"
    authenticated :user do
      root 'dashboard#index'
    end

    unauthenticated do
      root 'devise/sessions#new'
    end
  end
  #WEB ROUTES
  resources :roles
  resources :laboratories
  resources :clients
  resources :employees    
  resources :inventories
  resources :samples
  resources :contracts
  resources :sample_methods 
  resources :quotations
  resources :requests

end
