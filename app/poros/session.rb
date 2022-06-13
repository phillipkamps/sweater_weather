class Session
  attr_reader :email, :api_key, :id
  def initialize(email, api_key)
    @id = "null"
    @email = email
    @api_key = api_key
  end
end
