# require "rails_helper"
#
# RSpec.describe "Sweater Weather API" do
#   it "gets [lat,lng] for [city,state] from mapquest" do
#     city_state = "denver,co"
#     get "api/v1/forecast?location=#{city_state}"
#
#     response = JSON.parse(response.body, symbolize_names: true)
#     lat_lng = response[:data]
#
#     expect(response).to be_successful
#     expect(lat_lng.count).to eq(2)
#   end
# end
