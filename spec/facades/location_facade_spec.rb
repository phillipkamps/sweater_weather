require "rails_helper"

RSpec.describe LocationFacade do
  it ".coords gets only lat, long" do
    city_state = "madison,wi"
    coords = LocationFacade.coords(city_state)

    expect(coords).to be_a Hash
    expect(coords).to have_key :lat
    expect(coords).to have_key :lng
  end
end
