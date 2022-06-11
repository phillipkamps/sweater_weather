require "rails_helper"

RSpec.describe "Location Service" do
  it "gets [lat,lng] for [city,state] from mapquest" do
    city_state = "denver,co"

    response = LocationService.get_coords(city_state)

    expect(response).to be_a Hash
  end
end
