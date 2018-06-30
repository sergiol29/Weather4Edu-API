class Api::V1::DataVariablesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:update]

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
    msg_update = variable.update!(update_variable)
    # If all transition is correct, return true and status 200
    render json: { update_variable: msg_update }, status: 200

    # If occurred a error in rescue => error, error.message = it was not ...
    # Similar a try cath
    rescue => error
      render json: { error: "An error has occurred while processed variable, #{ error.message }", update_variable: msg_update }, status: 400
  end

  private
  def variable
    @variable = Variable.find(params[:id])
  end

  def groupped_variable
    data = {
        id: @variable.id,
        id_user: @variable.user_id,
        code: @variable.code,
        name: @variable.name,
        symbol: @variable.symbol,
        color: @variable.color
    }
  end

  def update_variable
    {
        name: params[:name],
        code: params[:code],
        symbol: params[:symbol],
        color: params[:color]
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
    !params[:id].present?
  end
end
