class Api::V1::VariablesUserController < ApplicationController
  # before action in def index, run function wrong_params?
  before_action :wrong_params?, only: [:show]

  def show
    if !user.nil?
      # If all transition is correct, return true and status 200
      render json: groupped_user, status: 200
    end

    # If occurred a error in rescue => error, error.message = it was not ...
    # Similar a try cath
    rescue => error
      render json: { error: "An error has occurred while processed variables, #{ error.message }" }, status: 400
  end

  private
  def user
    @user = User.find(params[:id])
  end

  def user_variables
    variables = @user.Variable
    variables.map{ |variable| groupped_variable(variable) }
  end

  def groupped_user
    data = {
        id: @user.id,
        email: @user.email,
        name: @user.name,
        company: @user.company,
        variables: user_variables
    }
  end

  def groupped_variable(variable)
    {
        id: variable.id,
        code: variable.code,
        name: variable.name,
        symbol: variable.symbol,
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
