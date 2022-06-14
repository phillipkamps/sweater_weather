class Session
  attr_reader :email, :api_key, :id
  def initialize(email, api_key)
    @id = User.find_by(email: email).id
    @email = email
    @api_key = api_key
  end
end
