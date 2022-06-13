class Api::V1::BookController < ApplicationController
  def search
    coords = LocationFacade.coords(params[:location])
    unfiltered_forecast = ForecastFacade.data(coords[:lat], coords[:lng])
    current_forecast = unfiltered_forecast.current

    unfiltered_book_json = BookFacade.data(params[:location], params[:quantity])
    render json: BookSerializer.new(unfiltered_book_json)
  end
end
