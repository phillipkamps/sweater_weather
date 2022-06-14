class Api::V1::RoadTripController < ApplicationController
  def create
    coords = LocationFacade.coords(params[:destination])
    unfiltered_forecast = ForecastFacade.data(coords[:lat], coords[:lng])
    travel_time = LocationFacade.directions(params[:origin], params[:destination]).travel_time
    render json: RoadTripSerializer.data(
      unfiltered_forecast,
      travel_time,
      params[:origin],
      params[:destination]
    )
  end
end
