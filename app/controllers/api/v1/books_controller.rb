class Api::V1::BooksController < ApplicationController
  def search
    coords = LocationFacade.coords(params[:location])
    unfiltered_forecast = ForecastFacade.data(coords[:lat], coords[:lng])
    current_forecast = unfiltered_forecast.current

    results = BooksFacade.search(params[:location], params[:quantity])
    render json: BooksSerializer.payload(results, current_forecast, params[:location])
  end
end
