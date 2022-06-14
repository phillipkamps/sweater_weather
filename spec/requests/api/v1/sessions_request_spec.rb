require "rails_helper"

RSpec.describe "Sweater Weather API" do
  it "logs in user" do
    user = User.create!(
      email: "test@testemail.com",
      password: "123abc",
      password_confirmation: "123abc",
      api_key: "testapikey"
    )
    headers = {
      "Content-type": "application/json",
      Accept: "application/json"
    }
    body = {
      email: user.email,
      password: user.password
    }
    post "/api/v1/sessions", headers: headers, params: JSON.generate(body)
    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)
    session_response = parsed[:data]

    expect(session_response[:id]).to be_a String
    expect(session_response[:type]).to eq "session"
    expect(session_response[:attributes][:email]).to be_a String
    expect(session_response[:attributes][:api_key]).to be_a String
  end
end
