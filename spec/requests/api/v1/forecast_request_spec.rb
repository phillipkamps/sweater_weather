# require "rails_helper"
#
# RSpec.describe "Sweater Weather API" do
#   it "uses [lat,lng] to get weather JSON" do
#     city_state = "madison,wi"
#     get "api/v1/forecast?location=#{city_state}"
#
#     response = JSON.parse(response.body, symbolize_names: true)
#     weather_json = response[:data]
#
#     expect(response).to be_successful
#   end
# end
