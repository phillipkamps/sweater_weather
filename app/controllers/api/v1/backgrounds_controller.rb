class Api::V1::BackgroundsController < ApplicationController
  def landing
    coords = LocationFacade.coords(params[:location])
    unfiltered_forecast = ForecastFacade.data(coords[:lat], coords[:lng])
    conditions = unfiltered_forecast.current.conditions
    unfiltered_image_json = BackgroundsFacade.data(params[:location], conditions)
    render json: BackgroundsSerializer.new(unfiltered_image_json)
  end
end
