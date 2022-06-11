require "rails_helper"

RSpec.describe Forecast do
  it "exists and has attributes" do
    lat = 43.073926
    lng = -89.385244
    data = ForecastFacade.data(lat, lng)
    forecast = Forecast.new(data)

    expect(forecast.current.count).to eq 14
    expect(forecast.daily.count).to eq 5
    expect(forecast.hourly.count).to eq 8
  end
end
