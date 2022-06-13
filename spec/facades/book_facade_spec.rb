require "rails_helper"

RSpec.describe BookFacade do
  it ".search returns correct search results" do
    city_state = "madison,wi"
    quantity = 5
    results = BookFacade.search(city_state, quantity)

    expect(results).to be_a Hash
    expect(results.count).to eq 5
    # expect(results).to have_key :lat
    # expect(results).to have_key :lng
  end
end
