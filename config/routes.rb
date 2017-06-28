Rails.application.routes.draw do
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
  resources :roles do
    put 'toggle_status', on: :member
  end
  resources :laboratories do
    put 'toggle_status', on: :member
  end
  resources :clients do
    put 'toggle_status', on: :member
  end
  resources :employees do
    put 'toggle_status', on: :member
  end
  resources :inventories do
    put 'toggle_status', on: :member
  end
  resources :supplies do
    put 'toggle_status', on: :member
  end  
  resources :sample_methods do
    put 'toggle_status', on: :member
  end
  resources :services do
    get 'work_check', on: :member
    put 'work_check_update', on: :member
  end
  resources :services do
    get 'service_end', on: :member
    put 'service_end_update', on: :member
  end
  
  resources :contracts
  resources :sample_methods
  resources :quotations do
    post 'get_sample_methods', on: :collection
  end
  resources :requests
  resources :results
  resources :work_orders
  resources :logs
  resources :service_quotations
  resources :services
  resources :sample_categories do
    put 'toggle_status', on: :member
  end
  resources :check_services
  resources :classified_services
  resources :work_classified_services  
end
