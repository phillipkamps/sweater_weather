class Api::V1::ForecastController < ApplicationController
  def landing
    coords = LocationFacade.coords(params[:location])
    unfiltered_forecast = ForecastFacade.data(coords[:lat], coords[:lng])
    render json: ForecastSerializer.filtered_forecast(unfiltered_forecast), status: :created
  end
end
