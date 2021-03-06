require "rails_helper"

RSpec.describe "Sweater Weather API" do
  it "gets correct books for destination" do
    city_state = "madison,wi"
    quantity = 5
    get "/api/v1/book-search?location=#{city_state}&quantity=#{quantity}"
    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)
    attributes = parsed[:data][:attributes]

    expect(parsed[:data][:id]).to eq "null"
    expect(parsed[:data][:type]).to eq "books"
    expect(attributes[:destination]).to eq city_state
    expect(attributes[:forecast][:summary]).to be_a String
    expect(attributes[:forecast][:temperature]).to be_a String
    expect(attributes[:total_books_found]).to be_an Integer
    expect(attributes[:books]).to be_an Array
    expect(attributes[:books][0].count).to eq quantity
    attributes[:books][0].each do |book_response|
      expect(book_response).to have_key :isbn
      expect(book_response[:title]).to be_a String
      expect(book_response[:publisher]).to be_an Array
    end
  end

  it "sends error for sad path" do
    city_state = "madison,wi"
    quantity = -1
    get "/api/v1/book-search?location=#{city_state}&quantity=#{quantity}"
    expect(response).to_not be_successful

    parsed_error = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_error[:status]).to eq "INCORRECT QUERY"
    expect(parsed_error[:message]).to eq "Location must be in [city, state] format, quantity must be integer greater than 0."
    expect(parsed_error[:code]).to eq 400
  end
end
