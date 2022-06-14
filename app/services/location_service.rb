class LocationService < BaseService
  class << self
    def get_data(city_state)
      response = conn("http://www.mapquestapi.com")
        .get("/geocoding/v1/address?key=#{location_key}&location=#{city_state}")
      get_json(response)
    end

    def get_directions(from, to)
      response = conn("http://www.mapquestapi.com")
        .get("/directions/v2/route?key=#{location_key}&from=#{from}&to=#{to}")
      get_json(response)
    end

    def location_key
      ENV["location_key"]
    end
  end
end
