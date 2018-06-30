class Input::V1::CreateVariablesController < ApplicationController
  skip_before_action :verify_authenticity_token

  # before action in def create, run function wrong_params?
  before_action :wrong_params?, only: [:create]

  def create
    # If the user who wants to create variable does not exist, not create the variable
    if !user.nil?
      @variable = Variable.create!(variables_attrs)

      # If all transition is correct, return true and status 200
      render json: { message: @variable }, status: 200
    end

    # If occurred a error in rescue => error, error.message = it was not ...
    # Similar a try cath
    rescue => error
    render json: { error: "An error has occurred while processed variable, #{ error.message }" }, status: 400
  end

  private
  def user
    @user ||= User.find_by(id: params[:user_id])
  end

  # created frame with params
  def variables_attrs
    {
        user_id: params[:user_id],
        code: params[:code],
        symbol: params[:symbol],
        name: params[:name],
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
    !params[:user_id].present? || !params[:code].present? || !params[:name].present?
  end
end
