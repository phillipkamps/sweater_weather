class Directions
  attr_reader :travel_time
  def initialize(data)
    @travel_time = data[:route][:realTime]
  end
end