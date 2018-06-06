Rails.application.routes.draw do

  # Change URL gem Rails admin
  mount RailsAdmin::Engine => '/manager', as: 'rails_admin'

  # # Routes for controller data in Controller > input > v1
  namespace :input do
    namespace :v1 do
      resources :save_data, only: [:create]
      #resources :device_update, only: [:update]
    end
  end

  # # Routes for controller data in Controller > input > v1
  namespace :api do
    namespace :v1 do
      resources :stations_user, only: [:index]
      #resources :device_update, only: [:update]
    end
  end

end
