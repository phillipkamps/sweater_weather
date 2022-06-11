require "rails_helper"

RSpec.describe "Location Service" do
  it "gets [lat,lng] for [city,state] from mapquest" do
    city_state = "denver,co"

    response = LocationService.get_coords(city_state)
    lat_lng = response[:results][0][:locations][0][:latLng]

    expect(lat_lng).to be_a Hash
    expect(lat_lng).to have_key :lat
    expect(lat_lng).to have_key :lng
  end
end
