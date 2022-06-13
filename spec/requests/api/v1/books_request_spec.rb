require "rails_helper"

RSpec.describe "Sweater Weather API" do
  it "gets correct books for destination" do
    city_state = "madison,wi"
    quantity = 5
    get "/api/v1/book-search?location=#{city_state}&quantity=#{quantity}"
    expect(response).to be_successful

    # parsed = JSON.parse(response.body, symbolize_names: true)
    # attributes = parsed[:data][:attributes]
    #
    # expect(attributes[:creator]).to be_a String
    # expect(attributes[:image_url]).to be_a String
    # expect(attributes).to_not have_key :created_at
    # expect(attributes).to_not have_key :downloads
  end
end
