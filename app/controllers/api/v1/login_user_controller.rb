class Api::V1::LoginUserController < ApplicationController
  # before action in def index, run function wrong_params?
  before_action :wrong_params?, only: [:index]

  def index
    if !user.nil? && BCrypt::Password.new(user.password_hash) == params[:password]
      # If all transition is correct, return true and status 200
      render json: groupped_user, status: 200
    else
      # Error Status 400 not exist User
      render json: [], status: 400
    end
  end

  private
  def user
    @user = User.find_by(email: params[:email])
  end

  def groupped_user
    data = {
        id: @user.id,
        email: @user.email,
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
    !params[:email].present? || !params[:password].present?
  end
end
