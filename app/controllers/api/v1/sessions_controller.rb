class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session = Session.new(user.email, user.api_key)
      render json: SessionSerializer.new(session), status: :created
    else
      render json: {error: "Invalid username or password"}, status: 401
    end
  end
end
