class Input::V1::TestViewhumansController < ApplicationController
  # before action in def update, run function wrong_params?
  before_action :wrong_params?, only: [:create]

  # METHOD POST
  def create
    check_eval(params[:value], params[:view_human])
  end

  private
  # Value is used in view_human string
  def check_eval(value, view_human)
    begin
      check = eval(view_human)

      # If eval is correct, return status 200
      render json: { result: "Good, all right!", message: "Result with value #{value} is #{check}" }, status: 200
    rescue Exception => e # If eval generate any errors, we control error
      # If eval not correct, return status 400
      render json: { result: "Ups!", message: "Syntax Error" }, status: 200
    end
  end

  # Check if params of JSON is correct
  def wrong_params?
    if has_not_mandatory_params?
      render json: { message: "Wrong data params" }, status: 400
    end
  end

  # Check if params DEVICE_CODE, UTC, DATA is present in JSON send
  def has_not_mandatory_params?
    !params[:view_human].present? || !params[:value].present?
  end
end
