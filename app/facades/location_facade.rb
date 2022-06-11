class LocationFacade
  class << self
    def lat(city_state)
      json = LocationService.get_data(city_state)
      json[:results][0][:locations][0][:latLng][:lat]
    end

    def lng(city_state)
      json = LocationService.get_data(city_state)
      lat = json[:results][0][:locations][0][:latLng]
      json[:results][0][:locations][0][:latLng][:lng]
    end
  end
end
