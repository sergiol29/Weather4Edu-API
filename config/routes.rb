Rails.application.routes.draw do

  # Change URL gem Rails admin
  mount RailsAdmin::Engine => '/manager', as: 'rails_admin'

  # # Routes for controller data in Controller > input > v1
  namespace :input do
    namespace :v1 do
      resources :save_data, only: [:create]
      resources :update_station, only: [:update]
    end
  end

  # # Routes for controller data in Controller > input > v1
  namespace :api do
    namespace :v1 do
      resources :login_user, only: [:index]
      resources :stations_user, only: [:index]
      resources :values_maxes_station, only: [:show]
      resources :values_mins_station, only: [:show]
    end
  end

end
