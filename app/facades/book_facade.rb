class BackgroundsFacade
  class << self
    def search(city_state, quantity)
      unfiltered_json = BookService.get_search(city_state, quantity)
      Book.new(unfiltered_json)
    end
  end
end
