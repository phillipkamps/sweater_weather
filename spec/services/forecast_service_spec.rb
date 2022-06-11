require "rails_helper"

RSpec.describe ForecastService do
  it "uses lat/lng to get forecast JSON" do
    lat = 43.073926
    lng = -89.385244
    response = ForecastService.get_data(lat, lng)

    expect(response).to be_a Hash
    expect(response).to have_key :current
    expect(response).to have_key :daily
    expect(response).to have_key :hourly
  end
end
