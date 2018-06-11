class Api::V1::StationsUserController < ApplicationController
  # before action in def index, run function wrong_params?
  before_action :wrong_params?, only: [:show]

  def show
    if !user.nil?
      # If all transition is correct, return true and status 200
      render json: groupped_user, status: 200
    else
      render json: [], status: 400
    end

    # If occurred a error in rescue => error, error.message = it was not ...
    # Similar a try cath
    rescue => error
      render json: { error: "An error has occurred while processed user, #{ error.message }" }, status: 400
  end

  private
  def user
    @user = User.find(params[:id])
  end

  def stations_user
    stations = @user.Station
    stations.map{ |station| groupped_station(station) }
  end

  def groupped_user
    data = {
        id: @user.id,
        email: @user.email,
        name: @user.name,
        company: @user.company,
        stations: stations_user
    }
  end

  def groupped_station(station)
    {
        id: station.id,
        name: station.name,
        latitude: station.latitude,
        longitude: station.longitude,
        last_frame: latest_frame(station)
    }
  end

  def latest_frame(station)
    last_frame =  station.LastFrame
    last_frame.map do |data|
      variable(data)
      groupped_last_frame(data)
    end
  end

  def groupped_last_frame(data)
    {
        code: @variable.code,
        name: @variable.name,
        symbol: @variable.symbol,
        value: data.value,
        timestamp: data.timestamp
    }
  end

  def variable(data)
    @variable = Variable.find(data.variable_id)
  end

  # Check if params of JSON is correct
  def wrong_params?
    if has_not_mandatory_params?
      render json: { message: "Wrong data params" }, status: 400
    end
  end

  # Check if params DEVICE_CODE, DATA is present in JSON send
  def has_not_mandatory_params?
    !params[:id].present?
  end

end
