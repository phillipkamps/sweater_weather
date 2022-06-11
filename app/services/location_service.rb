class LocationService < BaseService
  class << self
    def get_data(city_state)
      response = conn("http://www.mapquestapi.com")
        .get("/geocoding/v1/address?key=#{location_key}&location=#{city_state}")
      get_json(response)
    end
  end

  private

  def self.location_key
    ENV["location_key"]
  end
end
