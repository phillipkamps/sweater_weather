require "rails_helper"

RSpec.describe "Sweater Weather API" do
  it "gets correct background image" do
    city_state = "madison,wi"
    get "/api/v1/backgrounds?location=#{city_state}"

    image_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
  end
end
