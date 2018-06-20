class Api::V1::ValuesMinsStationController < ApplicationController
  before_action :wrong_params?, only: [:show]
  # before action in def show, run function wrong_params?

  def show
    @station = Station.find(params[:id])

    # If all transition is correct, return true and status 200
    render json: groupped_station, status: 200

    # If occurred a error in rescue => error, error.message = it was not ...
    # Similar a try cath
    rescue => error
    render json: { error: "An error has occurred while processed values mins, #{ error.message }" }, status: 400
  end

  private
  def user
    @user = User.find(@station.user_id)
  end

  def groupped_station
    data = {
        id: @station.id,
        name: @station.name,
        user_id: user.id,
        company: user.company,
        latitude: @station.latitude,
        longitude: @station.longitude,
        values_mins: values_mins
    }
  end

  def values_mins
    values_mins = @station.ValueMin
    values_mins.map do |data|
      variable(data)
      groupped_frame(data)
    end
  end

  def groupped_frame(data)
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
