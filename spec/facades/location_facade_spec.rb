require "rails_helper"

RSpec.describe LocationFacade do
  it ".lat gets latitude" do
    city_state = "madison,wi"
    lat = LocationFacade.lat(city_state)

    expect(lat).to be_a Float
  end

  it ".lng gets longitude" do
    city_state = "madison,wi"
    lng = LocationFacade.lng(city_state)

    expect(lng).to be_a Float
  end
end
