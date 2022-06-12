class BackgroundsService < BaseService
  class << self
    def get_data(city_state, conditions)
      response = conn("https://api.unsplash.com")
        .get("/photos/random/?client_id=#{backgrounds_key}&query=#{city_state} #{conditions}")
      get_json(response)
    end
  end

  def self.backgrounds_key
    ENV["backgrounds_key"]
  end
end
