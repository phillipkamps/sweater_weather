require "rails_helper"

RSpec.describe "Sweater Weather API" do
  it "creates new user" do
    headers = {
      "Content-type": "application/json",
      Accept: "application/json"
    }
    body = {
      email: "test@testemail.com",
      password: "123abc",
      password_confirmation: "123abc"
    }
    post "/api/v1/users", headers: headers, params: JSON.generate(body)

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)
    user_response = parsed[:data]

    expect(user_response[:id]).to be_a String
    expect(user_response[:type]).to eq "user"
    expect(user_response[:attributes][:email]).to be_a String
    expect(user_response[:attributes][:api_key]).to be_a String
    expect(user_response).to_not have_key :password
    expect(user_response).to_not have_key :password_confirmation
  end
end
