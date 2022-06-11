class ForecastFacade
  class << self
    def data(lat, lng)
      ForecastService.get_data(lat, lng)
    end
  end
end
