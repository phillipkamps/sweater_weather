require "rails_helper"

RSpec.describe "Sweater Weather API" do
  it "gets correct forecast information in proper format" do
    city_state = "madison,wi"
    get "/api/v1/forecast?location=#{city_state}"

    forecast_response = JSON.parse(response.body, symbolize_names: true)
    current_weather = forecast_response[:data][:attributes][:current_weather]
    daily_weather = forecast_response[:data][:attributes][:daily_weather][0]
    hourly_weather = forecast_response[:data][:attributes][:hourly_weather][0]

    expect(current_weather.count).to eq 10
    expect(current_weather[:datetime]).to be_a String
    expect(current_weather[:sunrise]).to be_a String
    expect(current_weather[:sunset]).to be_a String
    expect(current_weather[:temperature]).to be_a Float
    expect(current_weather[:feels_like]).to be_a Float
    expect(current_weather[:humidity]).to be_a Integer
    expect(current_weather[:uvi]).to be_a Float
    expect(current_weather[:visibility]).to be_a Integer
    expect(current_weather[:conditions]).to be_a String
    expect(current_weather[:icon]).to be_a String
    expect(current_weather).to_not have_key :pressure
    expect(current_weather).to_not have_key :dew_point
    expect(current_weather).to_not have_key :clouds
    expect(current_weather).to_not have_key :wind_speed
    expect(current_weather).to_not have_key :wind_deg

    expect(daily_weather.count).to eq 5
    daily_weather.each do |day|
      expect(day[:date]).to be_a String
      expect(day[:sunrise]).to be_a String
      expect(day[:sunset]).to be_a String
      expect(day[:max_temp]).to be_a Float
      expect(day[:min_temp]).to be_a Float
      expect(day[:conditions]).to be_a String
      expect(day[:icon]).to be_a String
    end

    expect(hourly_weather.count).to eq 8
    hourly_weather.each do |hour|
      expect(hour[:time]).to be_a String
      expect(hour[:temperature]).to be_a Float
      expect(hour[:conditions]).to be_a String
      expect(hour[:icon]).to be_a String
    end
  end
end
