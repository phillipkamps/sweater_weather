require "rails_helper"

RSpec.describe BookService do
  it "uses params to get JSON" do
    city_state = "madison,wi"
    results = BookService.get_search(city_state)

    expect(results).to be_a Hash
    expect(results).to have_key :numFound
    expect(results).to have_key :docs
  end
end
