class BooksService < BaseService
  class << self
    def get_search(city_state)
      response = conn("http://openlibrary.org")
        .get("/search.json?q=#{city_state}")
      get_json(response)
    end
  end
end
