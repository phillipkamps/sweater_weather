require "rails_helper"

RSpec.describe "Sweater Weather API" do
  it "creates road trip" do
    origin = "denver,co"
    destination = "madison,wi"

    user = User.create!(
      email: "test@testemail.com",
      password: "123abc",
      password_confirmation: "123abc",
      api_key: "testapikey"
    )
    headers = {
      "Content-type": "application/json",
      Accept: "application/json"
    }
    body = {
      origin: origin,
      destination: destination,
      api_key: user.api_key
    }
    post "/api/v1/road_trip", headers: headers, params: JSON.generate(body)
    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)
    road_trip_response = parsed[:data]
    road_trip_attributes = parsed[:data][:attributes]

    expect(road_trip_response[:id]).to eq nil
    expect(road_trip_response[:type]).to eq "roadtrip"
    expect(road_trip_attributes[:start_city]).to be_a String
    expect(road_trip_attributes[:start_city]).to_not eq(road_trip_attributes[:end_city])
    expect(road_trip_attributes[:end_city]).to be_a String
    expect(road_trip_attributes[:end_city]).to_not eq(road_trip_attributes[:start_city])
    expect(road_trip_attributes[:travel_time]).to be_a String
    expect(road_trip_attributes[:weather_at_eta][:temperature]).to be_a Float
    expect(road_trip_attributes[:weather_at_eta][:conditions]).to be_a String
  end

  it "presents correct response for sad path" do
    origin = "denver,co"
    destination = "tokyo,jp"

    user = User.create!(
      email: "test@testemail.com",
      password: "123abc",
      password_confirmation: "123abc",
      api_key: "testapikey"
    )
    headers = {
      "Content-type": "application/json",
      Accept: "application/json"
    }
    body = {
      origin: origin,
      destination: destination,
      api_key: user.api_key
    }
    post "/api/v1/road_trip", headers: headers, params: JSON.generate(body)
    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)
    road_trip_response = parsed[:data]
    road_trip_attributes = parsed[:data][:attributes]

    expect(road_trip_response[:id]).to eq nil
    expect(road_trip_response[:type]).to eq "roadtrip"
    expect(road_trip_attributes[:start_city]).to be_a String
    expect(road_trip_attributes[:start_city]).to_not eq(road_trip_attributes[:end_city])
    expect(road_trip_attributes[:end_city]).to be_a String
    expect(road_trip_attributes[:end_city]).to_not eq(road_trip_attributes[:start_city])
    expect(road_trip_attributes[:travel_time]).to eq "Impossible"
    expect(road_trip_attributes[:weather_at_eta]).to_not have_key :temperature
    expect(road_trip_attributes[:weather_at_eta]).to_not have_key :conditions
  end
end
