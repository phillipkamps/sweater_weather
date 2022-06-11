require "rails_helper"

RSpec.describe Location do
  it "exists and has attributes" do
    data = {lat: 43.073926, lng: -89.385244}
    madison = Location.new(data)

    expect(madison.lat).to eq data[:lat]
    expect(madison.lng).to eq data[:lng]
  end
end
