class Api::V1::UsersController < ApplicationController
  before_action :generate_api_key

  def create
    user = User.new(user_params)
    user.api_key = @key
    if user.password != user.password_confirmation || user.password.nil? && user.password_confirmation.nil?
      render json: {error: "Email or Password are incorrect or missing, please try again"}, status: 400
    elsif User.find_by(email: user[:email]).present? || user.email.nil?
      render json: {error: "Email or Password are incorrect or missing, please try again"}, status: 400
    else user.save
      render json: UsersSerializer.new(user), status: 201
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def generate_api_key
    @key = SecureRandom.urlsafe_base64(24)
  end
end
