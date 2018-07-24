Rails.application.routes.draw do
  # Auth user for App Angular
  #mount_devise_token_auth_for 'User', at: 'auth'

  # Auth rails admin with devise
  devise_for :users

  # Change URL gem Rails admin
  mount RailsAdmin::Engine => '/manager', as: 'rails_admin'

  # # Routes for controller data in Controller > input > v1
  namespace :input do
    namespace :v1 do
      resources :save_data, only: [:create]
      resources :update_station, only: [:update]
      resources :create_variables, only: [:create]
      resources :delete_variables, only: [:destroy]
      resources :test_viewhumans, only: [:create]
    end
  end

  # # Routes for controller data in Controller > input > v1
  namespace :api do
    namespace :v1 do
      resources :login_user, only: [:index]
      resources :stations_user, only: [:show]
      resources :values_maxes_station, only: [:show]
      resources :values_mins_station, only: [:show]
      resources :station_lasted_data, only: [:show]
      resources :variables_station, only: [:show]
      resources :data_variables, only: [:show, :update]
    end
  end

end
