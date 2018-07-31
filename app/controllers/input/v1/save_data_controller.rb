class Input::V1::SaveDataController < ApplicationController
  #skip_before_action :verify_authenticity_token

  # before action in def create, run function wrong_params?
  before_action :wrong_params?, :station, only: [:create]

  def create
    ActiveRecord::Base.transaction do
      @frame = Frame.create!(frame_attrs)
      params[:DATA].each do |code, value|
      next if value.nil? # Continue if variable value at JSON is not null
        variable(code) # Check if variable exist, else auto-created variable
        LastFrame.find_or_create_by!(lastframe_attrs).update(value: value, timestamp: time_now)
        save_data(value)
        save_value_max(value)
        save_value_min(value)
      end

      @frame.update(processed: true)

      # If all transition is correct, return true and status 200
      render json: { message: @frame }, status: 200
    end

    # If occurred a error in rescue => error, error.message = it was not ...
    # Similar a try cath
    rescue => error
      render json: { error: "An error has occurred while processed frame, #{ error.message }" }, status: 400
  end

  private
  # Before execute function create, check if station exist, else auto-created station
  def station
    if Station.exists?(code: params[:STATION_CODE])
      @station ||= Station.find_by(code: params[:STATION_CODE])
    else
      @station ||= Station.create!(station_attrs)
    end
  end

  # Check if variable exist, else auto-created station
  def variable(code)
    if Variable.exists?(code: code)
      @variable = Variable.find_by(code: code)
    else
      @variable = Variable.create!(code: code)
      ViewVariable.create!(station_id: @station.id, variable_id: @variable.id)
    end
  end

  def user_admin
    User.find_by(role: 'admin').id
  end

  def save_data(value)
    Datum.create!(data_attrs(value, @frame.id))
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

  # attrs for create station if not exist
  def station_attrs
    {
        code: params[:STATION_CODE],
        user_id: user_admin,
        name: '-'
    }
  end

  # created frame with params
  def frame_attrs
    {
        station_id: @station.id,
        raw: request.raw_post,
        source_ip: request.remote_ip,
        timestamp: time_now,
        processed: false
    }
  end

  # created last frame with params
  def lastframe_attrs
    {
        station_id: @station.id,
        variable_id: @variable.id,
    }
  end

  def data_attrs(value, frame_id)
    {
        frame_id: frame_id,
        station_id: @station.id,
        variable_id: @variable.id,
        value: value,
        timestamp: time_now
    }
  end

  def time_now
    Time.now.to_i
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
