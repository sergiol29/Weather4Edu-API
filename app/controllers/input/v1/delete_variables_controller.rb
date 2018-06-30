class Input::V1::DeleteVariablesController < ApplicationController
  skip_before_action :verify_authenticity_token

  # before action in def index, run function wrong_params?
  before_action :wrong_params?, only: [:destroy]

  def destroy
    @variable = Variable.find(params[:id])
    @variable.destroy

    # If deleted is correct, send status 200
    render json: {}, status: 200

    # If occurred a error in rescue => error, error.message = it was not ...
    # Similar a try cath
    rescue => error
      render json: { error: "An error has occurred while deleted variable, #{ error.message }" }, status: 400
  end

  private
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
