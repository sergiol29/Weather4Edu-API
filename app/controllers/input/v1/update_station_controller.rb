class Input::V1::UpdateStationController < ApplicationController
  skip_before_action :verify_authenticity_token

  # before action in def update, run function wrong_params?
  before_action :wrong_params?, only: [:update]

  # METHOD POST
  def update
    msg_update = station.update!(name: params[:name])
    # If all transition is correct, return true and status 200
    render json: { update_station: msg_update }, status: 200

    # If occurred a error in rescue => error, error.message = it was not ...
    # Similar a try cath
    rescue => error
      render json: { error: "An error has occurred while processed frame, #{ error.message }", update_station: msg_update }, status: 400
  end

  private
  def station
    @station ||= Station.find(params[:id])
  end

  # Check if params of JSON is correct
  def wrong_params?
    if has_not_mandatory_params?
      render json: { message: "Wrong data params" }, status: 400
    end
  end

  # Check if params DEVICE_CODE, UTC, DATA is present in JSON send
  def has_not_mandatory_params?
    !params[:id].present? || !params[:name].present?
  end
end
