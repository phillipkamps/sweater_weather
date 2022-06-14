class LocationFacade
  class << self
    def coords(city_state)
      json = LocationService.get_data(city_state)
      json[:results][0][:locations][0][:latLng]
    end

    def directions(from, to)
      unfiltered_directions_json = LocationService.get_directions(from, to)
      Directions.new(unfiltered_directions_json)
    end
  end
end
