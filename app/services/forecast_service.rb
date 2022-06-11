class ForecastService < BaseService
  class << self
    def get_data(lat, lng)
      response = conn("http://api.openweathermap.org")
        .get("data/2.5/onecall?lat=#{lat}&lon=#{lng}&appid=#{forecast_key}")
      get_json(response)
    end
  end

  private

  def self.forecast_key
    ENV["forecast_key"]
  end
end
