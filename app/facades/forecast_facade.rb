class ForecastFacade
  class << self
    def data(lat, lng)
      unfiltered_forecast_json = ForecastService.get_data(lat, lng)
      Forecast.new(unfiltered_forecast_json)
    end
  end
end
