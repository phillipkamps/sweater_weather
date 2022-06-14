class RoadTripSerializer
  def self.data(unfiltered_forecast, travel_time, origin, destination)
    {
      data: {
        id: "null",
        type: "roadtrip",
        attributes: {
          start_city: origin,
          end_city: destination,
          travel_time: ActiveSupport::Duration.build(travel_time).inspect,
          weather_at_eta: {
            temperature: unfiltered_forecast.hourly[travel_time / 3600].temperature,
            conditions: unfiltered_forecast.hourly[travel_time / 3600].conditions
          }
        }
      }
    }
  end
end
