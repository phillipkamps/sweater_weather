require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:password) }
    it { should validate_presence_of(:password_confirmation) }
    it { should validate_presence_of(:api_key) }
  end
end
