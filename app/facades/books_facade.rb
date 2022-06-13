class BooksFacade
  class << self
    def search(city_state, quantity)
      unfiltered_json = BooksService.get_search(city_state)
      Books.new(unfiltered_json, quantity)
    end
  end
end
