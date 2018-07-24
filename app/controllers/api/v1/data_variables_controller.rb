class Api::V1::DataVariablesController < ApplicationController
  #skip_before_action :verify_authenticity_token, only: [:update]

  # before action in def index, run function wrong_params?
  before_action :wrong_params?, only: [:show, :update]

  def show
    if !variable.nil?
      # If all transition is correct, return true and status 200
      render json: groupped_variable, status: 200
    end

    # If occurred a error in rescue => error, error.message = it was not ...
    # Similar a try cath
    rescue => error
      render json: { error: "An error has occurred while processed variable, #{ error.message }" }, status: 400
  end

  # METHOD POST
  def update
    if !variable.nil?
      msg_update = view_variable.update!(update_variable)
      # If all transition is correct, return true and status 200
      render json: { update_variable: msg_update }, status: 200
    end

    # If occurred a error in rescue => error, error.message = it was not ...
    # Similar a try cath
    rescue => error
      render json: { error: "An error has occurred while processed variable, #{ error.message }" }, status: 400
  end

  private
  def variable
    @variable = Variable.find(params[:id])
  end

  def view_variable
    @view_variable = ViewVariable.find_by(variable_id: @variable.id)
  end

  def groupped_variable
    data = {
        code: @variable.code,
        variable_id: view_variable.variable_id,
        name: @view_variable.name,
        symbol: @view_variable.symbol,
        color: @view_variable.color,
        view_human: @view_variable.view_human,
        last_value: value_last_data
    }
  end

  def value_last_data
    value = LastFrame.find_by(station_id: @view_variable.station_id, variable_id: @view_variable.variable_id)
    if !value.nil?
      return value.value
    else
      return 0
    end
  end

  def update_variable
    {
        name: params[:name].capitalize,
        symbol: params[:symbol],
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
    !params[:id].present?
  end
end
