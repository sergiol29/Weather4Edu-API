class Api::V1::ValuesMaxesStationController < ApplicationController
  before_action :wrong_params?, only: [:show]
  # before action in def index, run function wrong_params?

  def show
    @station = Station.find(params[:id])

    # If all transition is correct, return true and status 200
    render json: groupped_station, status: 200

    # If occurred a error in rescue => error, error.message = it was not ...
    # Similar a try cath
    rescue => error
    render json: { error: "An error has occurred while processed values maxes, #{ error.message }" }, status: 400
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
        values_maxes: values_maxes
    }
  end

  def values_maxes
    values_max = @station.ValueMax
    values_max.map do |data| # Read variables of ValueMax the station
      variable(data) # Get variable reading of ValueMax
      view_variable(data) # Get view_variable reading of ValueMax
      groupped_frame(data)
    end
  end

  def groupped_frame(data)
    {
        code: @variable.code,
        name: @view_variable.name,
        symbol: @view_variable.symbol,
        view_human: @view_variable.view_human,
        value: data.value,
        timestamp: data.timestamp
    }
  end

  def variable(data)
    @variable = Variable.find(data.variable_id)
  end

  def view_variable(data)
    @view_variable = @station.ViewVariable.find_by(variable_id: data.variable_id)
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
