class BackgroundsFacade
  class << self
    def data(city_state, conditions)
      unfiltered_json = BackgroundsService.get_data(city_state, conditions)
      Background.new(unfiltered_json)
    end
  end
end
