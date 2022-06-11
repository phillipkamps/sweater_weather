require "rails_helper"

RSpec.describe ForecastFacade do
  it ".data gets only required forecast data" do
    lat = 43.073926
    lng = -89.385244

    data = ForecastFacade.data(lat, lng)

    expect(data).to be_a Hash
    expect(data).to have_key :current
    expect(data).to have_key :daily
    expect(data).to have_key :hourly
  end
end
