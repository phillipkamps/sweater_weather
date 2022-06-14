class ApplicationController < ActionController::API
  def valid_api_key?
    if params[:api_key].present?
      if !User.exists?(api_key: params[:api_key])
        render json: {error: "Invalid API key"}, status: 401
      end
    else
      render json: {error: "Missing API key"}, status: 400
    end
  end
end
