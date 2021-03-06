require "rails_helper"

RSpec.describe Forecast do
  it "exists and has attributes" do
    lat = 43.073926
    lng = -89.385244
    forecast = ForecastFacade.data(lat, lng)

    expect(forecast.current).to be_an_instance_of Current
    expect(forecast.daily.count).to eq 8
    expect(forecast.hourly.count).to eq 48
  end
end
