require "rails_helper"

RSpec.describe LocationFacade do
  it ".coords gets only lat, long" do
    city_state = "madison,wi"
    coords = LocationFacade.coords(city_state)

    expect(coords).to be_a Hash
    expect(coords.count).to eq 2
    expect(coords).to have_key :lat
    expect(coords).to have_key :lng
  end

  it ".directions gets travel_time" do
    origin = "madison,wi"
    destination = "denver,co"

    response = LocationFacade.directions(origin, destination)

    expect(response).to be_a Directions
    expect(response.travel_time).to be_an Integer
  end
end
