class Api::V1::StationsUserController < ApplicationController
  # before action in def create, run function wrong_params?
  before_action :wrong_params?, only: [:index]

  def index
    if !user.nil? && BCrypt::Password.new(user.password_hash) == params[:password]
      # If all transition is correct, return true and status 200
      render json: groupped_data, status: 200
    end

    # If occurred a error in rescue => error, error.message = it was not ...
    # Similar a try cath
    rescue => error
      render json: { error: "An error has occurred while processed user, #{ error.message }" }, status: 400
  end

  private
  def user
    @user = User.find_by(email: params[:email])
  end

  # Check if params of JSON is correct
  def wrong_params?
    if has_not_mandatory_params?
      render json: { message: "Wrong data params" }, status: 400
    end
  end

  # Check if params DEVICE_CODE, DATA is present in JSON send
  def has_not_mandatory_params?
    !params[:email].present? || !params[:password].present?
  end

  def groupped_data
    data = {
        id: @user.id,
        email: @user.email,
        name: @user.name,
        company: @user.company,
        stations: stations_user
    }
  end

  def stations_user
    data = @user.Station
    data.map{ |station| groupped_station(station) }
  end

  def groupped_station(station)
    {
        id: station.id,
        name: station.name,
        latitude: station.latitude,
        longitude: station.longitude,
        last_frame: nil,
        value_max: nil,
        value_min: nil
    }
  end

end
