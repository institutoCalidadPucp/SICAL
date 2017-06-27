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
  resources :contracts do
  end
  resources :sample_methods do
  end
  resources :quotations do
  end
  resources :requests do
  end
  resources :results do
  end
  resources :work_orders do
  end
  resources :logs do
  end
  resources :service_quotations do
  end
  resources :services do
    get 'search', on: :collection
  end
  resources :sample_categories do
  end
  resources :check_services do
  end
end
