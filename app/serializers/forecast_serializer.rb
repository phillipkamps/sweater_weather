class ForecastSerializer
  def self.filtered_forecast(forecast)
    {
      data: {
        id: nil,
        type: "forecast",
        attributes: {
          current_weather: {
            datetime: Time.at(forecast.current[:dt]).to_datetime,
            sunrise: Time.at(forecast.current[:sunrise]).to_datetime,
            sunset: Time.at(forecast.current[:sunset]).to_datetime,
            temperature: forecast.current[:temp],
            feels_like: forecast.current[:feels_like],
            humidity: forecast.current[:humidity],
            uvi: forecast.current[:uvi],
            visibility: forecast.current[:visibility],
            description: forecast.current[:weather].first[:description],
            icon: forecast.current[:weather][0][:icon]
          },
          daily_weather: [
            {
              date: Time.at(forecast.daily[0][:dt]).to_date,
              sunrise: Time.at(forecast.daily[0][:sunrise]).to_datetime,
              sunset: Time.at(forecast.daily[0][:sunset]).to_datetime,
              max_temp: forecast.daily[0][:temp][:max],
              min_temp: forecast.daily[0][:temp][:min],
              conditions: forecast.daily[0][:weather][0][:description],
              icon: forecast.daily[0][:weather][0][:icon]
            },
            {
              date: Time.at(forecast.daily[1][:dt]).to_date,
              sunrise: Time.at(forecast.daily[1][:sunrise]).to_datetime,
              sunset: Time.at(forecast.daily[1][:sunset]).to_datetime,
              max_temp: forecast.daily[1][:temp][:max],
              min_temp: forecast.daily[1][:temp][:min],
              conditions: forecast.daily[1][:weather][0][:description],
              icon: forecast.daily[1][:weather][0][:icon]
            },
            {
              date: Time.at(forecast.daily[2][:dt]).to_date,
              sunrise: Time.at(forecast.daily[2][:sunrise]).to_datetime,
              sunset: Time.at(forecast.daily[2][:sunset]).to_datetime,
              max_temp: forecast.daily[2][:temp][:max],
              min_temp: forecast.daily[2][:temp][:min],
              conditions: forecast.daily[2][:weather][0][:description],
              icon: forecast.daily[2][:weather][0][:icon]
            },
            {
              date: Time.at(forecast.daily[3][:dt]).to_date,
              sunrise: Time.at(forecast.daily[3][:sunrise]).to_datetime,
              sunset: Time.at(forecast.daily[3][:sunset]).to_datetime,
              max_temp: forecast.daily[3][:temp][:max],
              min_temp: forecast.daily[3][:temp][:min],
              conditions: forecast.daily[3][:weather][0][:description],
              icon: forecast.daily[3][:weather][0][:icon]
            },
            {
              date: Time.at(forecast.daily[4][:dt]).to_date,
              sunrise: Time.at(forecast.daily[4][:sunrise]).to_datetime,
              sunset: Time.at(forecast.daily[4][:sunset]).to_datetime,
              max_temp: forecast.daily[4][:temp][:max],
              min_temp: forecast.daily[4][:temp][:min],
              conditions: forecast.daily[4][:weather][0][:description],
              icon: forecast.daily[4][:weather][0][:icon]
            }
          ],
          hourly_weather: [
            {
              time: Time.at(forecast.hourly[0][:dt]).to_datetime,
              temperature: forecast.hourly[0][:temp],
              conditions: forecast.hourly[0][:weather][0][:description],
              icon: forecast.hourly[0][:weather][0][:icon]
            },
            {
              time: Time.at(forecast.hourly[1][:dt]).to_datetime,
              temperature: forecast.hourly[1][:temp],
              conditions: forecast.hourly[1][:weather][0][:description],
              icon: forecast.hourly[1][:weather][0][:icon]
            },
            {
              time: Time.at(forecast.hourly[2][:dt]).to_datetime,
              temperature: forecast.hourly[2][:temp],
              conditions: forecast.hourly[2][:weather][0][:description],
              icon: forecast.hourly[2][:weather][0][:icon]
            },
            {
              time: Time.at(forecast.hourly[3][:dt]).to_datetime,
              temperature: forecast.hourly[3][:temp],
              conditions: forecast.hourly[3][:weather][0][:description],
              icon: forecast.hourly[3][:weather][0][:icon]
            },
            {
              time: Time.at(forecast.hourly[4][:dt]).to_datetime,
              temperature: forecast.hourly[4][:temp],
              conditions: forecast.hourly[4][:weather][0][:description],
              icon: forecast.hourly[4][:weather][0][:icon]
            },
            {
              time: Time.at(forecast.hourly[5][:dt]).to_datetime,
              temperature: forecast.hourly[5][:temp],
              conditions: forecast.hourly[5][:weather][0][:description],
              icon: forecast.hourly[5][:weather][0][:icon]
            },
            {
              time: Time.at(forecast.hourly[6][:dt]).to_datetime,
              temperature: forecast.hourly[6][:temp],
              conditions: forecast.hourly[6][:weather][0][:description],
              icon: forecast.hourly[6][:weather][0][:icon]
            },
            {
              time: Time.at(forecast.hourly[7][:dt]).to_datetime,
              temperature: forecast.hourly[7][:temp],
              conditions: forecast.hourly[7][:weather][0][:description],
              icon: forecast.hourly[7][:weather][0][:icon]
            }
          ]
        }
      }
    }
  end.to_json
end
