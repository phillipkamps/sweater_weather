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
  end
end
