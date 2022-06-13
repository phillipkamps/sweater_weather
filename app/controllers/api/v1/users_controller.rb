class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.api_key = SecureRandom.alphanumeric(16)
    if user.save
      render json: UserSerializer.new(user), status: :created
      # else
      #   database_error(user)
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :api_key)
  end
end
