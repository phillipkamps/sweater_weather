require "rails_helper"

RSpec.describe "Sweater Weather API" do
  it "gets correct forecast information" do
    city_state = "madison,wi"
    get "/api/v1/forecast?location=#{city_state}"

    forecast_response = JSON.parse(response.body, symbolize_names: true)
    json = forecast_response[:data]

    expect(response).to be_successful
  end
end
