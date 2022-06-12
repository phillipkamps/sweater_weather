require "rails_helper"

RSpec.describe "Sweater Weather API" do
  it "gets correct forecast information" do
    city_state = "madison,wi"
    get "/api/v1/forecast?location=#{city_state}"

    forecast_response = JSON.parse(response.body, symbolize_names: true)
    current_weather = forecast_response[:data][:attributes][:current_weather]
    daily_weather = forecast_response[:data][:attributes][:daily_weather]
    hourly_weather = forecast_response[:data][:attributes][:hourly_weather]

    expect(response).to be_successful

    expect(current_weather[:datetime]).to be_a String
    expect(current_weather[:icon]).to be_a String
    expect(current_weather).to_not have_key :pressure

    expect(daily_weather.count).to eq 5
    expect(daily_weather[0][:date]).to be_a String
    expect(daily_weather[4][:icon]).to be_a String
    expect(daily_weather[0]).to_not have_key :moonrise

    expect(hourly_weather.count).to eq 8
    expect(hourly_weather[0][:time]).to be_a String
    expect(hourly_weather[7][:icon]).to be_a String
    expect(hourly_weather[0]).to_not have_key :humidity
  end
end
