class Api::V1::StationLastedDataController < ApplicationController
  before_action :wrong_params?, only: [:show]
  # before action in def show, run function wrong_params?

  def show
    @datum = station.Datum.where('timestamp >= ? and timestamp <= ?', params[:from], params[:to]).group_by(&:variable_id)


    # If all transition is correct, return true and status 200
    render json: groupped_station, status: 200

    # If occurred a error in rescue => error, error.message = it was not ...
    # Similar a try cath
    rescue => error
    render json: { error: "An error has occurred while processed station lasted data, #{ error.message }" }, status: 400
  end

  private
  def station
    @station = Station.find(params[:id])
  end

  def variable(variable_id)
    @variable = Variable.find(variable_id)
  end

  def groupped_station
    data = {
        id: @station.id,
        name: @station.name,
        company: @station.company,
        latitude: @station.latitude,
        longitude: @station.longitude,
        data: groupped_variable
    }
  end

  def groupped_variable
    response = []
    @datum.each do |variable_id, data|
      variable(variable_id)
      variable_data = base_variable
      variable_data[:values] = data.map { |datum| { timestamp: datum.timestamp, value: datum.value } }
      response.push(variable_data)
    end
    response
  end

  def base_variable
    {
        id: @variable.id,
        code: @variable.code,
        name: @variable.name,
        symbol: @variable.symbol,
        values: []
    }
  end

  # Check if params of JSON is correct
  def wrong_params?
    if has_not_mandatory_params?
      render json: { message: "Wrong data params" }, status: 400
    end
  end

  # Check if params DEVICE_CODE, DATA is present in JSON send
  def has_not_mandatory_params?
    !params[:id].present? || !params[:from].present? || !params[:to].present?
  end
end
