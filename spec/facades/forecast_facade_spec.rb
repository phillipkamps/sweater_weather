require "rails_helper"

RSpec.describe ForecastFacade do
  it ".data gets only required forecast data" do
    lat = 43.073926
    lng = -89.385244

    data = ForecastFacade.data(lat, lng)

    expect(data).to be_an_instance_of Forecast
    expect(data.current).to be_an_instance_of Current
    expect(data.daily).to be_an Array
    expect(data.hourly).to be_an Array
  end
end
