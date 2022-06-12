class ForecastFacade
  class << self
    def data(lat, lng)
      unfiltered_json = ForecastService.get_data(lat, lng)
      Forecast.new(unfiltered_json)
    end
  end
end
