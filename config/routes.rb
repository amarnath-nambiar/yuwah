Rails.application.routes.draw do

  resources :courses

  resources :colleges do

    collection do
      get 'search'
    end

    member do
      get 'courses'
      get 'profile'
    end
  end

  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end
  # devise_for :users, skip: [:registrations]

  devise_for :users, skip: [:registrations], controllers: {
    passwords: 'users/passwords'
  }

  resources :users do

    collection do
      get 'my_profile'
    end
  end

  resources :students

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
