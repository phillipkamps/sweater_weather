class Api::V1::UsersController < ApplicationController
  def create
    # if User.exists?(email: params[:user][:email])
    #   user = User.find_by(email: params[:user][:email])
    #   render json: UserSerializer.new(user)
    # else

    user = User.new(user_params)
    user.api_key = SecureRandom.alphanumeric(16)
    if user.save
      render json: UserSerializer.new(user), status: :created
      # else
      #   database_error(user)
    end
    # end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :api_key)
  end
end
