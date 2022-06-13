require "rails_helper"

RSpec.describe BookService do
  it "uses params to get JSON" do
    city_state = "madison,wi"
    quantity = 5
    results = BookService.get_search(city_state, quantity)

    expect(results).to be_a Hash
    expect(results.count).to eq 5
    # expect(results).to have_key :lat
    # expect(results).to have_key :lng
  end
end
