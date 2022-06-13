require "rails_helper"

RSpec.describe Forecast do
  it "exists and has attributes" do
    city_state = "madison,wi"
    quantity = 5
    results = BookFacade.search(city_state, quantity)

    expect(results).to be_a Hash
    expect(results.count).to eq(quantity)
  end
end
