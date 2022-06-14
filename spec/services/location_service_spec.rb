require "rails_helper"

RSpec.describe LocationService do
  it "gets [lat,lng] for [city,state] from mapquest" do
    city_state = "madison,wi"

    response = LocationService.get_data(city_state)

    expect(response).to be_a Hash
    expect(response).to have_key :results
  end

  it "gets directions from mapquest given two inputs" do
    origin = "madison,wi"
    destination = "denver,co"

    response = LocationService.get_directions(origin, destination)

    expect(response).to be_a Hash
    expect(response[:route][:realTime]).to be_an Integer
  end
end
