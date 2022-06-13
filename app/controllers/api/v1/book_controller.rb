class Api::V1::BookController < ApplicationController
  def search
    coords = LocationFacade.coords(params[:location])
    unfiltered_forecast = ForecastFacade.data(coords[:lat], coords[:lng])
    current_forecast = unfiltered_forecast.current

    results = BookFacade.search(params[:location], params[:quantity])
    binding.pry
    render json: BookSerializer.new(results)
  end
end
