class Api::V1::BooksController < ApplicationController
  def search
    if params[:location].nil? || params[:location] == " " || params[:location] == "" || params[:location].class != String || params[:quantity].nil? || params[:quantity] == " " || params[:quantity] == " " || params[:quantity].to_i <= 0
      error = Error.new(400, "INCORRECT QUERY", "Location must be in [city, state] format, quantity must be integer greater than 0.")
      render json: ErrorSerializer.serialized_json(error), status: 400
    else
      coords = LocationFacade.coords(params[:location])
      unfiltered_forecast = ForecastFacade.data(coords[:lat], coords[:lng])
      current_forecast = unfiltered_forecast.current

      results = BooksFacade.search(params[:location], params[:quantity])
      render json: BooksSerializer.payload(results, current_forecast, params[:location])
    end
  end
end
