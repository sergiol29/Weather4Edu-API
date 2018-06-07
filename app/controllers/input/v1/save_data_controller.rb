class Input::V1::SaveDataController < ApplicationController
  skip_before_action :verify_authenticity_token

  # before action in def create, run function wrong_params?
  before_action :wrong_params?, only: [:create]

  def create
    ActiveRecord::Base.transaction do
      frame = Frame.create!(frame_attrs)

      params[:DATA].each do |code, value|
      next if value.nil? || variable(code).nil? # Continuar solo si el valor de la variable en el JSON es true y el codigo de la variable existe en la BD
        LastFrame.find_or_create_by!(lastframe_attrs).update(value: value, timestamp: time_now)
        save_value_max(value)
        save_value_min(value)
      end

      frame.update(processed: true)

      # If all transition is correct, return true and status 200
      render json: { message: frame }, status: 200
    end

    # If occurred a error in rescue => error, error.message = it was not ...
    # Similar a try cath
    rescue => error
    render json: { error: "An error has occurred while processed frame, #{ error.message }" }, status: 400
  end

  private
  def station
    @station ||= Station.find_by(code: params[:STATION_CODE])
  end

  def variable(variable)
    @variable = Variable.find_by(code: variable)
  end

  def save_value_max(value)
    frame_max = ValueMax.find_or_create_by!(lastframe_attrs)

    if frame_max.value <= value
      frame_max.update(value: value, timestamp: time_now)
    end
  end

  def save_value_min(value)
    frame_min = ValueMin.find_or_create_by!(lastframe_attrs)

    if frame_min.value >= value
      frame_min.update(value: value, timestamp: time_now)
    end
  end

  # created frame with params
  def frame_attrs
    {
        station_id: station.id,
        raw: request.raw_post,
        source_ip: request.remote_ip,
        timestamp: time_now,
        processed: false
    }
  end

  # created last frame with params
  def lastframe_attrs
    {
        station_id: station.id,
        variable_id: @variable.id,
    }
  end

  def time_now
    Time.now
  end

  # Check if params of JSON is correct
  def wrong_params?
    if has_not_mandatory_params?
      render json: { message: "Wrong data params" }, status: 400
    end
  end

  # Check if params DEVICE_CODE, DATA is present in JSON send
  def has_not_mandatory_params?
    !params[:STATION_CODE].present? || !params[:DATA].present?
  end
end
