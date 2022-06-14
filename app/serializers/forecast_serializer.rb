class ForecastSerializer
  def self.filtered_forecast(unfiltered_forecast)
    {
      data: {
        id: nil,
        type: "forecast",
        attributes: {
          current_weather: {
            datetime: Time.at(unfiltered_forecast.current.datetime).to_datetime.to_formatted_s(:short),
            sunrise: Time.at(unfiltered_forecast.current.sunrise).to_datetime.to_formatted_s(:short),
            sunset: Time.at(unfiltered_forecast.current.sunset).to_datetime.to_formatted_s(:short),
            temperature: unfiltered_forecast.current.temperature,
            feels_like: unfiltered_forecast.current.feels_like,
            humidity: unfiltered_forecast.current.humidity,
            uvi: unfiltered_forecast.current.uvi,
            visibility: unfiltered_forecast.current.visibility,
            conditions: unfiltered_forecast.current.conditions,
            icon: unfiltered_forecast.current.icon
          },
          daily_weather: [
            unfiltered_forecast.daily[0..4].map do |day|
              {
                date: Time.at(day.date).to_date,
                sunrise: Time.at(day.sunrise).to_datetime.to_formatted_s(:short),
                sunset: Time.at(day.sunset).to_datetime.to_formatted_s(:short),
                max_temp: day.max_temp,
                min_temp: day.min_temp,
                conditions: day.conditions,
                icon: day.icon
              }
            end
          ],
          hourly_weather: [
            unfiltered_forecast.hourly[0..7].map do |hour|
              {
                time: Time.at(hour.time).to_datetime.to_formatted_s(:short),
                temperature: hour.temperature,
                conditions: hour.conditions,
                icon: hour.icon
              }
            end
          ]
        }
      }
    }
  end.to_json
end
