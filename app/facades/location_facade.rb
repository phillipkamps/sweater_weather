class LocationFacade
  class << self
    def coords(city_state)
      json = LocationService.get_data(city_state)
      json[:results][0][:locations][0][:latLng]
    end
  end
end
