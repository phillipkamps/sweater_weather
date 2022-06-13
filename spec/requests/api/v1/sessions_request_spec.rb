require "rails_helper"

RSpec.describe "Sweater Weather API" do
  it "logs in user" do
    headers = {
      "Content-type": "application/json",
      Accept: "application/json"
    }
    body = {
      email: "test@testemail.com",
      password: "123abc"
    }
    post "/api/v1/sessions", headers: headers, params: JSON.generate(body)

    expect(response).to be_successful
  end
end
