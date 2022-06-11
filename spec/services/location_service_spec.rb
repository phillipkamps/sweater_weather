require "rails_helper"

RSpec.describe "Location Service" do
  it "gets [lat,lng] for [city,state] from mapquest" do
    city_state = "madison,wi"

    response = LocationService.get_data(city_state)

    expect(response).to be_a Hash
    expect(response).to have_key :results
  end
end
