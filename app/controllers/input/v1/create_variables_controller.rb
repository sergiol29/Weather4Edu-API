class Input::V1::CreateVariablesController < ApplicationController
  #skip_before_action :verify_authenticity_token

  # before action in def create, run function wrong_params?
  before_action :wrong_params?, only: [:create]

  def create
    # If the user who wants to create variable does not exist, not create the variable
    if !station.nil?
      ActiveRecord::Base.transaction do
        @variable = Variable.create!(code: params[:code].upcase)
        @view_variable = ViewVariable.create!(view_variables_attrs)

        # If all transition is correct, return true and status 200
        render json: { message: @variable }, status: 200
      end
    end

    # If occurred a error in rescue => error, error.message = it was not ...
    # Similar a try cath
    rescue => error
    render json: { error: "An error has occurred while processed variable, #{ error.message }" }, status: 400
  end

  private
  def station
    @station ||= Station.find_by(id: params[:station_id])
  end

  # created frame with params
  def view_variables_attrs
    {
        station_id: @station.id,
        variable_id: @variable.id,
        symbol: params[:symbol],
        name: params[:name].capitalize,
        color: params[:color],
        view_human: downcase_view_human
    }
  end

  def downcase_view_human
    if !params[:view_human].nil?
      return params[:view_human].downcase
    else
      return params[:view_human]
    end
  end

  # Check if params of JSON is correct
  def wrong_params?
    if has_not_mandatory_params?
      render json: { message: "Wrong data params" }, status: 400
    end
  end

  # Check if params DEVICE_CODE, DATA is present in JSON send
  def has_not_mandatory_params?
    !params[:station_id].present? || !params[:code].present?
  end
end
